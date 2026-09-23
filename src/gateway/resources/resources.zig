const std = @import("std");

const utils = @import("zigcord-utils");

// Receivable payloads
pub const application_commands = @import("./application_commands.zig");
pub const auto_moderation = @import("./auto_moderation.zig");
pub const channels = @import("./channels.zig");
pub const entitlements = @import("./entitlements.zig");
pub const guilds = @import("./guilds.zig");
pub const integrations = @import("./integrations.zig");
pub const interactions = @import("./interactions.zig");
pub const invites = @import("./invites.zig");
pub const messages = @import("./messages.zig");
pub const polls = @import("./polls.zig");
pub const presence = @import("./presence.zig");
pub const rate_limits = @import("./rate_limits.zig");
pub const stage_instances = @import("./stage_instances.zig");
pub const subscriptions = @import("./subscriptions.zig");
pub const voice = @import("./voice.zig");
pub const webhooks = @import("./webhooks.zig");

// Sendable
pub const IdentifyEventPayload = @import("./identify.zig");
pub const ResumeEventPayload = @import("./resume.zig");
pub const RequestChannelInfoEventPayload = @import("./request_channel_info.zig");
pub const RequestGuildMembersEventPayload = @import("./request_guild_members.zig");
pub const RequestSoundboardSoundsEventPayload = @import("./request_soundboard_sounds.zig");
pub const UpdatePresenceEventPayload = @import("./update_presence.zig");
pub const UpdateVoiceStateEventPayload = @import("./update_voice_state.zig");

// Receivable
pub const HelloEventPayload = @import("./hello.zig");
pub const InvalidSessionEventPayload = @import("./invalid_session.zig");
pub const ReadyEventPayload = @import("./ready.zig");
pub const ReconnectEventPayload = utils.Null;
pub const ResumedEventPayload = utils.Null;

// Sendable/Receivable
pub const HeartbeatEventPayload = @import("./heartbeat.zig");

test {
    std.testing.refAllDecls(@This());
}
