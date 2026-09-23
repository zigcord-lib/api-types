const utils = @import("zigcord-utils");

const Guild = @import("../guild/guild.zig");
const Channel = @import("../channel/channel.zig");
const User = @import("../user/user.zig");
const Application = @import("../application/application.zig");
const GuildScheduledEvent = @import("../guild_scheduled_event/guild_scheduled_event.zig");
const Role = @import("../../role/role.zig");

const Invite = @This();

type: u8,
code: []const u8,
guild: utils.Optional(utils.PartialStruct(Guild)) = .missing,
channel: ?utils.PartialStruct(Channel) = null,
inviter: utils.Optional(User) = .missing,
target_type: utils.Optional(u8) = .missing,
target_user: utils.Optional(User) = .missing,
target_application: utils.Optional(utils.PartialStruct(Application)) = .missing,
approximate_presence_count: utils.Optional(u32) = .missing,
approximate_member_count: utils.Optional(u32) = .missing,
expires_at: ?[]const u8 = null,
guild_scheduled_event: utils.Optional(GuildScheduledEvent) = .missing,
flags: utils.Optional(u8) = .missing,
roles: utils.Optional([]const utils.PartialStruct(Role)) = .missing,

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
    members: []const utils.PartialStruct(Guild.GuildMember),
    participant_count: u32,
    speaker_count: u32,
    topic: []const u8,
};
