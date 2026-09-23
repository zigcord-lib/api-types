const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const RequestSoundboardSoundsEventPayload = @This();

guild_ids: []const Snowflake,
