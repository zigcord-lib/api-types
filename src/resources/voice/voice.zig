const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const Guild = @import("../guild/guild.zig");

const Voice = @This();

guild_id: utils.Optional(Snowflake) = .missing,
channel_id: ?Snowflake = null,
user_id: Snowflake,
member: utils.Optional(Guild.GuildMember) = .missing,
session_id: []const u8,
deaf: bool,
mute: bool,
self_deaf: bool,
self_mute: bool,
self_stream: utils.Optional(bool) = .missing,
self_video: bool,
suppress: bool,
request_to_speak_timestamp: ?[]const u8 = null,

pub const VoiceRegion = struct {
    id: []const u8,
    name: []const u8,
    optimal: bool,
    deprecated: bool,
    custom: bool,
};
