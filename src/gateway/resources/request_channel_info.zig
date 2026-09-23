const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const RequestChannelInfoEventPayload = @This();

guild_id: Snowflake,
fields: []const []const u8,
