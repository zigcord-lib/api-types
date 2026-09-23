const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");

const Channel = @This();

id: Snowflake,
type: ChannelType,
guild_id: utils.Optional(Snowflake) = .missing,
position: utils.Optional(u32) = .missing,
permission_overwrites: []const Overwrite,
name: utils.Optional(?[]const u8) = .missing,
topic: utils.Optional(?[]const u8) = .missing,
nsfw: utils.Optional(bool) = .missing,
last_message_id: utils.Optional(?Snowflake) = .missing,
bitrate: utils.Optional(u32) = .missing,
user_limit: utils.Optional(u32) = .missing,
rate_limit_per_user: utils.Optional(u32) = .missing,
recipients: utils.Optional([]const User) = .missing,
icon: utils.Optional(?[]const u8) = .missing,
owner_id: utils.Optional(Snowflake) = .missing,
application_id: utils.Optional(?Snowflake) = .missing,
managed: utils.Optional(bool) = .missing,
parent_id: utils.Optional(?Snowflake) = .missing,
last_pin_timestamp: utils.Optional(?[]const u8) = .missing,
rtc_region: utils.Optional(?[]const u8) = .missing,
video_quality_mode: utils.Optional(VideoQualityMode) = .missing,
message_count: utils.Optional(u32) = .missing,
member_count: utils.Optional(u32) = .missing,
thread_metadata: utils.Optional(ThreadMetadata) = .missing,
member: utils.Optional(ThreadMember) = .missing,
default_auto_archive_duration: utils.Optional(u32) = .missing,
permissions: utils.Optional([]const u8) = .missing,
app_permissions: utils.Optional([]const u8) = .missing,
flags: utils.Optional(u64) = .missing,
total_message_sent: utils.Optional(u32) = .missing,
available_tags: utils.Optional([]const ForumTag) = .missing,
applied_tags: utils.Optional([]const Snowflake) = .missing,
default_reaction_emoji: utils.Optional(?DefaultReaction) = .missing,
default_thread_rate_limit_per_user: utils.Optional(u32) = .missing,
default_sort_order: utils.Optional(?u32) = .missing,
default_forum_layout: utils.Optional(ForumLayoutType) = .missing,

pub const ChannelType = enum(u8) {
    guild_text = 0,
    dm = 1,
    guild_voice = 2,
    group_dm = 3,
    guild_category = 4,
    guild_announcement = 5,
    announcement_thread = 10,
    public_thread = 11,
    private_thread = 12,
    guild_stage_voice = 13,
    guild_directory = 14,
    guild_forum = 15,
    guild_media = 16,
};

pub const VideoQualityMode = enum(u8) {
    auto = 1,
    full = 2,
};

pub const ChannelFlag = enum(u16) {
    pinned = 1 << 1,
    require_tag = 1 << 4,
    hide_media_download_options = 1 << 15,
    channel_obfuscated = 1 << 17,
    is_spoiler_channel = 1 << 21,
};

pub const SortOrderType = enum(u8) {
    latest_activity = 0,
    creation_date = 1,
};

pub const ForumLayoutType = enum(u8) {
    not_set = 0,
    list_view = 1,
    gallery_view = 2,
};

pub const FollowedChannel = struct {
    channel_id: Snowflake,
    webhook_id: Snowflake,
};

pub const Overwrite = struct {
    id: Snowflake,
    type: u8,
    allow: []const u8,
    deny: []const u8,
};

pub const ThreadMetadata = struct {
    archived: bool,
    auto_archive_duration: u32,
    archive_timestamp: []const u8,
    locked: bool,
    invitable: utils.Optional(bool) = .missing,
    create_timestamp: utils.Optional(?[]const u8) = .missing,
};

pub const ThreadMember = struct {
    id: utils.Optional(Snowflake) = .missing,
    user_id: utils.Optional(Snowflake) = .missing,
    join_timestamp: []const u8,
    flags: u64,
    member: utils.Optional(Guild.GuildMember) = .missing,
};

pub const DefaultReaction = struct {
    emoji_id: ?Snowflake = null,
    emoji_name: ?[]const u8 = null,
};

pub const ForumTag = struct {
    id: Snowflake,
    name: []const u8,
    moderated: bool,
    emoji_id: ?Snowflake = null,
    emoji_name: ?[]const u8 = null,
};
