const Snowflake = @import("../../snowflake.zig").Snowflake;

code: []const u8,
name: []const u8,
description: ?[]const u8,
usage_count: u32,
creator_id: Snowflake,
// creator: TODO: support this
created_at: []const u8,
updated_at: []const u8,
source_guild_id: Snowflake,
// serialized_source_guild: TODO: support this
is_dirty: ?bool = null,
