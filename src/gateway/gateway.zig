const std = @import("std");

pub const resources = @import("./resources/resources.zig");

pub const GatewayOpcode = @import("./opcode.zig").GatewayOpcode;
pub const GatewaySendableEvent = @import("./sendable_event.zig");
pub const GatewayReceivableEventPayload = @import("./receivable_event_payload.zig").GatewayReceivableEventPayload;
pub const GatewaySendableEventPayload = @import("./sendable_event_payload.zig").GatewaySendableEventPayload;

test {
    std.testing.refAllDecls(@This());
}
