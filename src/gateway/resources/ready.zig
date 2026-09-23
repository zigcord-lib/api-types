const utils = @import("zigcord-utils");

const ReadyEventPayload = @This();

v: u32,
// user: TODO: support this
// guilds: TODO: support this
session_id: []const u8,
resume_gateway_url: []const u8,
shard: utils.Optional([2]u32) = .missing,
// application: TODO: support this
