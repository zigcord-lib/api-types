const Snowflake = @import("../../snowflake/snowflake.zig");

const StageInstance = @This();

id: Snowflake,
guild_id: Snowflake,
channel_id: Snowflake,
topic: []const u8,
privacy_level: PrivacyLevel,
discoverable_disabled: bool,
guild_scheduled_event_id: ?Snowflake = null,

pub const PrivacyLevel = enum(u8) {
    public = 1,
    guild_only = 2,
};
