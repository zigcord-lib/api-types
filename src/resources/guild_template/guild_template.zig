const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");

const GuildTemplate = @This();

code: []const u8,
name: []const u8,
description: ?[]const u8,
usage_count: u32,
creator_id: Snowflake,
creator: User,
created_at: []const u8,
updated_at: []const u8,
source_guild_id: Snowflake,
serialized_source_guild: PartialStruct(Guild),
is_dirty: ?bool = null,
