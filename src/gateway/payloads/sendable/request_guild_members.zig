const Snowflake = @import("../../../snowflake/snowflake.zig").Snowflake;

guild_id: Snowflake,
query: ?[]const u8 = null,
limit: u32,
presences: ?bool = null,
user_ids: ?[]const Snowflake = null,
nonce: ?[]const u8 = null,
