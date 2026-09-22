const std = @import("std");
const mem = std.mem;
const json = std.json;

pub const GatewayOpcode = enum(u8) {
    dispatch = 0,
    heartbeat = 1,
    identify = 2,
    presence_update = 3,
    voice_state_update = 4,
    @"resume" = 6,
    reconnect = 7,
    request_guild_members = 8,
    invalid_session = 9,
    hello = 10,
    heartbeat_ack = 11,
    request_soundboard_sounds = 31,
    request_channel_info = 43,

    pub inline fn isSendable(self: GatewayOpcode) bool {
        return switch (self) {
            .heartbeat,
            .identify,
            .presence_update,
            .voice_state_update,
            .@"resume",
            .request_guild_members,
            .request_soundboard_sounds,
            .request_channel_info,
            => true,
            else => false,
        };
    }

    pub inline fn isReceivable(self: GatewayOpcode) bool {
        return switch (self) {
            .dispatch,
            .heartbeat,
            .reconnect,
            .invalid_session,
            .hello,
            .heartbeat_ack,
            => true,
            else => false,
        };
    }

    pub inline fn jsonStringify(self: GatewayOpcode, jws: *json.Stringify) !void {
        return jws.write(@intFromEnum(self));
    }
};

const testing = std.testing;

test "deserialize from JSON" {
    const raw_json =
        \\ [0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 31, 43]
    ;

    const parsed = try json.parseFromSlice(
        []const GatewayOpcode,
        testing.allocator,
        raw_json,
        .{},
    );
    defer parsed.deinit();

    try testing.expectEqual(.dispatch, parsed.value[0]);
    try testing.expectEqual(.heartbeat, parsed.value[1]);
    try testing.expectEqual(.identify, parsed.value[2]);
    try testing.expectEqual(.presence_update, parsed.value[3]);
    try testing.expectEqual(.voice_state_update, parsed.value[4]);
    try testing.expectEqual(.@"resume", parsed.value[5]);
    try testing.expectEqual(.reconnect, parsed.value[6]);
    try testing.expectEqual(.request_guild_members, parsed.value[7]);
    try testing.expectEqual(.invalid_session, parsed.value[8]);
    try testing.expectEqual(.hello, parsed.value[9]);
    try testing.expectEqual(.heartbeat_ack, parsed.value[10]);
    try testing.expectEqual(.request_soundboard_sounds, parsed.value[11]);
    try testing.expectEqual(.request_channel_info, parsed.value[12]);
}

test "serialize to JSON" {
    const opcodes: []const GatewayOpcode = &[_]GatewayOpcode{
        .dispatch,
        .heartbeat,
        .identify,
        .presence_update,
        .voice_state_update,
        .@"resume",
        .reconnect,
        .request_guild_members,
        .invalid_session,
        .hello,
        .heartbeat_ack,
        .request_soundboard_sounds,
        .request_channel_info,
    };

    const raw_json = try json.Stringify.valueAlloc(testing.allocator, opcodes, .{});
    defer testing.allocator.free(raw_json);

    try std.testing.expectEqualStrings(
        \\[0,1,2,3,4,6,7,8,9,10,11,31,43]
    , raw_json);
}
