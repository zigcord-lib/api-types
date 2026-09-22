const Snowflake = @import("../snowflake/snowflake.zig").Snowflake;

const Role = @This();

id: Snowflake,
name: []const u8,
// color:u32 TODO: deprecated, review
colors: RoleColors,
hoist: bool,
icon: ?[]const u8 = null,
unicode_emoji: ?[]const u8 = null,
position: u32,
permissions: []const u8,
managed: bool,
mentionable: bool,
tags: ?RoleTags = null,
flags: u8,

pub const RoleTags = struct {
    bot_id: ?Snowflake = null,
    integration_id: ?Snowflake = null,
    premium_subscriber: ?void = null, // TODO: review this
    subscription_listing_id: ?Snowflake = null,
    available_for_purchase: ?void = null, // TODO: review this
    guild_connections: ?void = null, // TODO: review this
};

pub const RoleColors = struct {
    primary_color: u32,
    secondary_color: ?u32 = null,
    tertiary_color: ?u32 = null,
};

pub const RoleFlag = enum(u8) {
    in_prompt = 1 << 0,
};
