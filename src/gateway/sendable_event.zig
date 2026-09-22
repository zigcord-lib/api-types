const std = @import("std");

const GatewayOpcode = @import("./opcode.zig").GatewayOpcode;
const GatewaySendableEventPayload = @import("./sendable_event_payload.zig").GatewaySendableEventPayload;

pub const GatewaySendableEvent = struct {
    op: GatewayOpcode,
    d: GatewaySendableEventPayload,

    pub fn init(comptime op: GatewayOpcode, d: GatewaySendableEventPayload) InitError!GatewaySendableEvent {
        if (!op.isSendable()) {
            return InitError.InvalidOpcode;
        }

        if (d.toGatewayOpcode() != op) {
            return InitError.InvalidPayload;
        }

        return .{ .op = op, .d = d };
    }

    pub const InitError = error{ InvalidOpcode, InvalidPayload };
};

const testing = std.testing;

test "serialize to JSON" {
    const event: GatewaySendableEvent = try .init(.heartbeat, .{ .heartbeat = 30 });

    const raw = try std.json.Stringify.valueAlloc(testing.allocator, event, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"op":1,"d":30}
    , raw);
}
