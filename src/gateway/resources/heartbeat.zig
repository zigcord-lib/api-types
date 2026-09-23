const std = @import("std");
const mem = std.mem;
const json = std.json;
const fmt = std.fmt;

const HeartbeatEventPayload = @This();

seq: u64,

pub fn jsonParse(_: mem.Allocator, source: *json.Scanner, _: json.ParseOptions) !HeartbeatEventPayload {
    const seq = switch (try source.next()) {
        .number, .allocated_number => |s| try fmt.parseInt(u64, s, 10),
        else => return error.UnexpectedToken,
    };

    return .{ .seq = seq };
}

pub fn jsonStringify(self: HeartbeatEventPayload, jws: *json.Stringify) !void {
    return jws.write(self.seq);
}

const testing = std.testing;

test "deserialize from JSON" {
    const raw =
        \\{"op": 1,"d": 251}
    ;

    const Event = struct {
        op: u8,
        d: HeartbeatEventPayload,
    };

    const parsed = try json.parseFromSlice(Event, testing.allocator, raw, .{});
    defer parsed.deinit();

    try testing.expectEqual(1, parsed.value.op);
    try testing.expectEqual(251, parsed.value.d.seq);
}

test "serialize to JSON" {
    const Event = struct { op: u8, d: HeartbeatEventPayload };

    const raw = try json.Stringify.valueAlloc(testing.allocator, Event{
        .op = 1,
        .d = .{ .seq = 1 },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"op":1,"d":1}
    , raw);
}
