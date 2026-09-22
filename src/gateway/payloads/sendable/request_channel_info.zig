const Snowflake = @import("../../../snowflake.zig").Snowflake;

pub const GatewayRequestChannelInfoEventPayload = struct {
    guild_id: Snowflake,
    fields: []const []const u8,
};
