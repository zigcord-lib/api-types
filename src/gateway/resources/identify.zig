const std = @import("std");
const json = std.json;

const utils = @import("zigcord-utils");

const IdentifyEventPayload = @This();

token: []const u8,
properties: ConnectionProperties,
compress: utils.Optional(bool) = .missing,
large_threshold: utils.Optional(u16) = .missing,
shard: utils.Optional([2]u32) = .missing,
// presence: TODO: support this
intents: u64,
capabilities: utils.Optional(u64) = .missing,

pub fn jsonStringify(self: *const IdentifyEventPayload, jws: *json.Stringify) !void {
    try jws.beginObject();

    try jws.objectField("token");
    try jws.write(self.token);

    try jws.objectField("properties");
    try jws.write(self.properties);

    if (self.compress.get()) |compress| {
        try jws.objectField("compress");
        try jws.write(compress);
    }

    if (self.large_threshold.get()) |large_threshold| {
        try jws.objectField("large_threshold");
        try jws.write(large_threshold);
    }

    if (self.shard.get()) |shard| {
        try jws.objectField("shard");
        try jws.write(shard);
    }

    try jws.objectField("intents");
    try jws.write(self.intents);

    if (self.capabilities.get()) |capabilities| {
        try jws.objectField("capabilities");
        try jws.write(capabilities);
    }

    try jws.endObject();
}

pub const ConnectionProperties = struct {
    os: []const u8,
    browser: []const u8,
    device: []const u8,
};

const testing = std.testing;

test "serialize to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, IdentifyEventPayload{
        .token = "<token>",
        .properties = .{ .os = "zigcord", .browser = "zigcord", .device = "zigcord" },
        .intents = 0,
        .capabilities = .{ .present = 10 },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"token":"<token>","properties":{"os":"zigcord","browser":"zigcord","device":"zigcord"},"intents":0,"capabilities":10}
    , raw);
}
