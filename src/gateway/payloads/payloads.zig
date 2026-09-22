const std = @import("std");

pub const receivable = @import("./receivable/receivable.zig");
pub const sendable = @import("./sendable/sendable.zig");

test {
    std.testing.refAllDecls(@This());
}
