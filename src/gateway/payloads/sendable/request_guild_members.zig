pub const GatewayRequestGuildMembersEventPayload = struct {
    guild_id: []const u8,
    query: ?[]const u8 = null,
    limit: u32,
    presences: ?bool = null,
    user_ids: ?[]const []const u8 = null,
    nonce: ?[]const u8 = null,
};
