const std = @import("std");

pub const dispatch_payloads = @import("./dispatch_payloads/dispatch_payloads.zig");

pub const GatewayHelloEventPayload = @import("./hello.zig");
pub const GatewayReadyEventPayload = @import("./ready.zig");

test {
    std.testing.refAllDecls(@This());
}
