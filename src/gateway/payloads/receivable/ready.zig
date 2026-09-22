pub const GatewayReadyEventPayload = struct {
    v: u32,
    // user: TODO: support this
    // guilds: TODO: support this
    session_id: []const u8,
    resume_gateway_url: []const u8,
    shard: ?[2]u32 = null,
    // application: TODO: support this
};
