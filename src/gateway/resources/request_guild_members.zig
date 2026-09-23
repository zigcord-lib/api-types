const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

guild_id: Snowflake,
query: utils.Optional([]const u8) = .missing,
limit: u32,
presences: utils.Optional(bool) = .missing,
user_ids: utils.Optional([]Snowflake) = .missing,
nonce: utils.Optional([]const u8) = .missing,
