const Snowflake = @import("../../snowflake.zig").Snowflake;

guild_id: ?Snowflake = null,
channel_id: ?Snowflake = null,
user_id: Snowflake,
// member: TODO: support this
session_id: []const u8,
deaf: bool,
mute: bool,
self_deaf: bool,
self_mute: bool,
self_stream: ?bool = null,
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
