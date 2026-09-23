const std = @import("std");
const json = std.json;

const gateway_resources = @import("./resources/resources.zig");
const GatewayOpcode = @import("./opcode.zig").GatewayOpcode;

pub const GatewaySendableEventPayload = union(enum) {
    identify: gateway_resources.IdentifyEventPayload,
    @"resume": gateway_resources.ResumeEventPayload,
    heartbeat: gateway_resources.HeartbeatEventPayload,
    request_guild_members: gateway_resources.RequestGuildMembersEventPayload,
    request_soundboard_sounds: gateway_resources.RequestSoundboardSoundsEventPayload,
    request_channel_info: gateway_resources.RequestChannelInfoEventPayload,

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
