const std = @import("std");

pub const GatewayIdentifyEventPayload = @import("./identify.zig").GatewayIdentifyEventPayload;
pub const GatewayResumeEventPayload = @import("./resume.zig").GatewayResumeEventPayload;
pub const GatewayRequestGuildMembersEventPayload = @import("./request_guild_members.zig").GatewayRequestGuildMembersEventPayload;
pub const GatewayRequestSoundboardSoundsEventPayload = @import("./request_soundboard_sounds.zig").GatewayRequestSoundboardSoundsEventPayload;
pub const GatewayRequestChannelInfoEventPayload = @import("./request_channel_info.zig").GatewayRequestChannelInfoEventPayload;

test {
    std.testing.refAllDecls(@This());
}
