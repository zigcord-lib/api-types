const std = @import("std");

pub const resources = @import("./gateway/gateway.zig");

test {
    std.testing.refAllDecls(@This());
}
