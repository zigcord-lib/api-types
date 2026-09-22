pub const Invite = struct {
    // type: TODO: support this
    code: []const u8,
    // guild: TODO: support this
    // channel: TODO: support this
    // inviter: TODO: support this
    // target_type: TODO: support this
    // target_user: TODO: support this
    // target_application: TODO: support this
    approximate_presence_count: ?u32 = null,
    approximate_member_count: ?u32 = null,
    expires_at: ?[]const u8 = null,
    // guild_scheduled_event: TODO: support this
    // flags: TODO: support this
    // roles: TODO: support this
};

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
    // members: TODO: support this
    participant_count: u32,
    speaker_count: u32,
    topic: []const u8,
};
