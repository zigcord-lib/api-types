const std = @import("std");
const json = std.json;

const utils = @import("zigcord-utils");

const Snowflake = @import("../snowflake/snowflake.zig").Snowflake;

const Role = @This();

id: Snowflake,
name: []const u8,
// color: u32 DEPRECATED
colors: RoleColors,
hoist: bool,
icon: utils.Optional(?[]const u8) = .missing,
unicode_emoji: utils.Optional(?[]const u8) = .missing,
position: u32,
permissions: []const u8,
managed: bool,
mentionable: bool,
tags: utils.Optional(RoleTags) = .missing,
flags: u8,

pub const RoleTags = struct {
    bot_id: utils.Optional(Snowflake) = .missing,
    integration_id: utils.Optional(Snowflake) = .missing,
    premium_subscriber: utils.Optional(utils.Null) = .missing, // If it exists as null, I suppose that should be considered true?
    subscription_listing_id: utils.Optional(Snowflake) = .missing,
    available_for_purchase: utils.Optional(utils.Null) = .missing, // If it exists as null, I suppose that should be considered true?
    guild_connections: utils.Optional(utils.Null) = .missing, // If it exists as null, I suppose that should be considered true?
};

pub const RoleColors = struct {
    primary_color: u32,
    secondary_color: ?u32 = null,
    tertiary_color: ?u32 = null,
};

pub const RoleFlag = enum(u8) {
    in_prompt = 1 << 0,
};

const testing = std.testing;

test "deserialize Role from JSON" {
    const raw =
        \\{"id":"41771983423143936","name":"WE DEM BOYZZ!!!!!!","color":3447003,"colors":{"primary_color":3447003,"secondary_color":null,"tertiary_color":null},"hoist":true,"icon":"cf3ced8600b777c9486c6d8d84fb4327","unicode_emoji":null,"position":1,"permissions":"66321471","managed":false,"mentionable":false,"flags":0}
    ;

    const parsed = try json.parseFromSlice(Role, testing.allocator, raw, .{
        .ignore_unknown_fields = true, // For deprecated color field
    });
    defer parsed.deinit();
}

test "deserialize RoleTags from JSON" {
    const raw =
        \\{}
    ;

    const parsed = try json.parseFromSlice(RoleTags, testing.allocator, raw, .{});
    defer parsed.deinit();
}
