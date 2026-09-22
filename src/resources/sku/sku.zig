const Snowflake = @import("../../snowflake.zig");

const SKU = @This();

id: Snowflake,
type: SKUType,
application_id: Snowflake,
name: []const u8,
slug: []const u8,
flags: u64,

pub const SKUType = enum(u8) {
    durable = 2,
    consumable = 3,
    subscription = 5,
    subscription_group = 6,
};

pub const SKUFlag = enum(u8) {
    available = 1 << 2,
    guild_subscription = 1 << 7,
    user_subscription = 1 << 8,
};
