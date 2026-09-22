const PartialStruct = @import("zigcord-utils").PartialStruct;

const Guild = @import("../guild/guild.zig");
const Channel = @import("../channel/channel.zig");
const User = @import("../user/user.zig");
const Application = @import("../application/application.zig");
const GuildScheduledEvent = @import("../guild_scheduled_event/guild_scheduled_event.zig");
const Role = @import("../../role.zig");

const Invite = @This();

type: u8,
code: []const u8,
guild: ?PartialStruct(Guild) = null,
channel: ?PartialStruct(Channel) = null,
inviter: ?User = null,
target_type: ?u8 = null,
target_user: ?User = null,
target_application: ?PartialStruct(Application) = null,
approximate_presence_count: ?u32 = null,
approximate_member_count: ?u32 = null,
expires_at: ?[]const u8 = null,
guild_scheduled_event: ?GuildScheduledEvent = null,
flags: ?u8 = null,
roles: ?PartialStruct(Role) = null,

pub const InviteType = enum(u8) {
    guild = 0,
    group_dm = 1,
    friend = 2,
};

pub const InviteTargetType = enum(u8) {
    stream = 1,
    embedded_application = 2,
};

pub const GuildInviteFlag = enum(u8) {
    is_guest_invite = 1 << 0,
};

pub const InviteMetadata = struct {
    uses: u32,
    max_uses: u32,
    max_age: u32,
    temporary: bool,
    created_at: []const u8,
};

pub const InviteStageInstance = struct {
    members: []const PartialStruct(Guild.GuildMember),
    participant_count: u32,
    speaker_count: u32,
    topic: []const u8,
};
