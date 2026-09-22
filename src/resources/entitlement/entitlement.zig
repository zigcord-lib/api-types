const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const Entitlement = @This();

id: Snowflake,
sku_id: Snowflake,
application_id: Snowflake,
user_id: ?Snowflake = null,
type: EntitlementType,
deleted: bool,
starts_at: ?[]const u8 = null,
ends_at: ?[]const u8 = null,
guild_id: ?Snowflake = null,
consumed: ?bool = null,

pub const EntitlementType = enum(u8) {
    purchase = 1,
    premium_subscription = 2,
    developer_gift = 3,
    test_mode_purchase = 4,
    free_purchase = 5,
    user_gift = 6,
    premium_purchase = 7,
    application_subscription = 8,
};
