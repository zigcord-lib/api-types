const utils = @import("zigcord-utils");

token: []const u8,
properties: ConnectionProperties,
compress: utils.Optional(bool) = .missing,
large_threshold: utils.Optional(u16) = .missing,
shard: utils.Optional([2]u32) = .missing,
// presence: TODO: support this
intents: u64,
capabilities: utils.Optional(u64) = .missing,

pub const ConnectionProperties = struct {
    os: []const u8,
    browser: []const u8,
    device: []const u8,
};
