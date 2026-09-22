const std = @import("std");
const json = std.json;

const sendable_payloads = @import("./payloads/sendable/sendable.zig");
const GatewayOpcode = @import("./opcode.zig").GatewayOpcode;

pub const GatewaySendableEventPayload = union(enum) {
    identify: sendable_payloads.GatewayIdentifyEventPayload,
    @"resume": sendable_payloads.GatewayResumeEventPayload,
    heartbeat: ?u64,
    request_guild_members: sendable_payloads.GatewayRequestGuildMembersEventPayload,
    request_soundboard_sounds: sendable_payloads.GatewayRequestSoundboardSoundsEventPayload,
    request_channel_info: sendable_payloads.GatewayRequestChannelInfoEventPayload,

    pub inline fn toGatewayOpcode(self: GatewaySendableEventPayload) GatewayOpcode {
        return switch (self) {
            .identify => GatewayOpcode.identify,
            .@"resume" => GatewayOpcode.@"resume",
            .heartbeat => GatewayOpcode.heartbeat,
            .request_guild_members => GatewayOpcode.request_guild_members,
            .request_soundboard_sounds => GatewayOpcode.request_soundboard_sounds,
            .request_channel_info => GatewayOpcode.request_channel_info,
        };
    }

    pub fn jsonStringify(self: GatewaySendableEventPayload, jws: *json.Stringify) !void {
        return switch (self) {
            inline else => |payload| jws.write(payload),
        };
    }
};

const testing = std.testing;

test "serialize identify to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{
        .identify = .{
            .token = "<token>",
            .properties = .{
                .os = "zigcord",
                .browser = "zigcord",
                .device = "zigcord",
            },
            .shard = [2]u32{ 0, 1 },
            .intents = 1,
        },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"token":"<token>","properties":{"os":"zigcord","browser":"zigcord","device":"zigcord"},"compress":false,"large_threshold":50,"shard":[0,1],"intents":1,"capabilities":0}
    , raw);
}

test "serialize resume to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{
        .@"resume" = .{
            .token = "<token>",
            .session_id = "<session_id>",
            .seq = 1,
        },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"token":"<token>","session_id":"<session_id>","seq":1}
    , raw);
}

test "serialize heartbeat to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{
        .heartbeat = 1,
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\1
    , raw);
}

test "serialize request_guild_members to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{ .request_guild_members = .{
        .guild_id = "<id>",
        .limit = 1,
    } }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"guild_id":"<id>","query":null,"limit":1,"presences":null,"user_ids":null,"nonce":null}
    , raw);
}

test "serialize request_soundboard_sounds to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{
        .request_soundboard_sounds = .{
            .guild_ids = &.{ "<id1>", "<id2>" },
        },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"guild_ids":["<id1>","<id2>"]}
    , raw);
}

test "serialize request_channel_info to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, GatewaySendableEventPayload{
        .request_channel_info = .{
            .guild_id = "<id>",
            .fields = &.{"status"},
        },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"guild_id":"<id>","fields":["status"]}
    , raw);
}
