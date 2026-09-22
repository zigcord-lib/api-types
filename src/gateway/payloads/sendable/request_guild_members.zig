const Snowflake = @import("../../../snowflake.zig").Snowflake;

pub const GatewayRequestGuildMembersEventPayload = struct {
    guild_id: Snowflake,
    query: ?[]const u8 = null,
    limit: u32,
    presences: ?bool = null,
    user_ids: ?[]const Snowflake = null,
    nonce: ?[]const u8 = null,
};
