const Snowflake = @import("../../snowflake.zig").Snowflake;

id: Snowflake,
// type: TODO: support this
guild_id: ?Snowflake = null,
channel_id: ?Snowflake = null,
// user: TODO: support this
name: ?[]const u8 = null,
avatar: ?[]const u8 = null,
token: ?[]const u8 = null,
application_id: ?Snowflake = null,
// source_guild: TODO: support this
// source_channel: TODO: support this
url: ?[]const u8 = null,

pub const WebhookType = enum(u8) {
    incoming = 1,
    channel_follower = 2,
    application = 3,
};
