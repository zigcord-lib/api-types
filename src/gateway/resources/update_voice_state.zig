const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const UpdateVoiceStateEventPayload = @This();

guild_id: Snowflake,
channel_id: ?Snowflake = null,
self_mute: bool,
self_deaf: bool,
