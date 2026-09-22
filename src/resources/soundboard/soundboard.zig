const Snowflake = @import("../../snowflake.zig").Snowflake;

name: []const u8,
sound_id: Snowflake,
volume: f64,
emoji_id: ?Snowflake = null,
emoji_name: ?[]const u8 = null,
guild_id: ?Snowflake = null,
available: bool,
// user: TODO: support this
