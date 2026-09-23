const std = @import("std");
const json = std.json;

const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const RequestGuildMembersEventPayload = @This();

guild_id: Snowflake,
query: utils.Optional([]const u8) = .missing,
limit: u32,
presences: utils.Optional(bool) = .missing,
user_ids: utils.Optional([]const Snowflake) = .missing,
nonce: utils.Optional([]const u8) = .missing,

pub fn jsonStringify(self: *const RequestGuildMembersEventPayload, jws: *json.Stringify) !void {
    try jws.beginObject();

    try jws.objectField("guild_id");
    try jws.write(self.guild_id);

    if (self.query.get()) |query| {
        try jws.objectField("query");
        try jws.write(query);
    }

    try jws.objectField("limit");
    try jws.write(self.limit);

    if (self.presences.get()) |presences| {
        try jws.objectField("presences");
        try jws.write(presences);
    }

    if (self.user_ids.get()) |user_ids| {
        try jws.objectField("user_ids");
        try jws.write(user_ids);
    }

    if (self.nonce.get()) |nonce| {
        try jws.objectField("nonce");
        try jws.write(nonce);
    }

    try jws.endObject();
}

const testing = std.testing;

test "serialize to JSON" {
    const raw = try json.Stringify.valueAlloc(testing.allocator, RequestGuildMembersEventPayload{
        .guild_id = "id",
        .limit = 1,
        .user_ids = .{ .present = &.{ "id1", "id2" } },
    }, .{});
    defer testing.allocator.free(raw);

    try testing.expectEqualStrings(
        \\{"guild_id":"id","limit":1,"user_ids":["id1","id2"]}
    , raw);
}
