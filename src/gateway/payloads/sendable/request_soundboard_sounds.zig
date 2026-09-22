const Snowflake = @import("../../../snowflake.zig").Snowflake;

pub const GatewayRequestSoundboardSoundsEventPayload = struct {
    guild_ids: []const Snowflake,
};
