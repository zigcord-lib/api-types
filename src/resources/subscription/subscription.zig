const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const Subscription = @This();

id: Snowflake,
user_id: Snowflake,
sku_ids: []const Snowflake,
entitlement_ids: []const Snowflake,
renewal_sku_ids: ?[]const Snowflake = null,
current_period_start: []const u8 = null,
current_period_end: []const u8 = null,
status: SubscriptionStatuses,
canceled_at: ?[]const u8 = null,
country: ?[]const u8 = null,

pub const SubscriptionStatuses = enum(u8) {
    active = 0,
    inactive = 1,
    ending = 2,
};
