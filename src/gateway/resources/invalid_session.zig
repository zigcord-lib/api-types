const std = @import("std");
const mem = std.mem;
const json = std.json;

const InvalidSessionEventPayload = @This();

resumable: bool,

pub fn jsonParse(_: mem.Allocator, source: *json.Scanner, _: json.ParseOptions) !InvalidSessionEventPayload {
    const resumable = switch (try source.next()) {
        .true => true,
        .false => false,
        else => return error.UnexpectedToken,
    };

    return .{ .resumable = resumable };
}

const testing = std.testing;

test "deserialize from JSON" {
    const raw =
        \\{"op": 9,"d": false}
    ;

    const Event = struct {
        op: u8,
        d: InvalidSessionEventPayload,
    };

    const parsed = try json.parseFromSlice(Event, testing.allocator, raw, .{});
    defer parsed.deinit();

    try testing.expect(!parsed.value.d.resumable);
}
