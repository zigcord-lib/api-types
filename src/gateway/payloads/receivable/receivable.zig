const std = @import("std");

pub const dispatch_payloads = @import("./dispatch_payloads/dispatch_payloads.zig");

pub const GatewayHelloEventPayload = @import("./hello.zig").GatewayHelloEventPayload;
pub const GatewayReadyEventPayload = @import("./ready.zig").GatewayReadyEventPayload;

test {
    std.testing.refAllDecls(@This());
}
