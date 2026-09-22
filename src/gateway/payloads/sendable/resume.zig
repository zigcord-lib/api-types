pub const GatewayResumeEventPayload = struct {
    token: []const u8,
    session_id: []const u8,
    seq: u64,
};
