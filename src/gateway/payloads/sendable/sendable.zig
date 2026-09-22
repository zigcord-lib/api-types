const std = @import("std");

pub const GatewayIdentifyEventPayload = @import("./identify.zig");
pub const GatewayResumeEventPayload = @import("./resume.zig");
pub const GatewayRequestGuildMembersEventPayload = @import("./request_guild_members.zig");
pub const GatewayRequestSoundboardSoundsEventPayload = @import("./request_soundboard_sounds.zig");
pub const GatewayRequestChannelInfoEventPayload = @import("./request_channel_info.zig");

test {
    std.testing.refAllDecls(@This());
}
