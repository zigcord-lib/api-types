token: []const u8,
properties: ConnectionProperties,
compress: bool = false,
large_threshold: u8 = 50, // min 50 max 250
shard: ?[2]u32 = null,
// presence: TODO: support this
intents: u64,
capabilities: u64 = 0,

pub const ConnectionProperties = struct {
    os: []const u8,
    browser: []const u8,
    device: []const u8,
};
