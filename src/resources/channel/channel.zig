const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");

const Channel = @This();

id: Snowflake,
type: ChannelType,
guild_id: ?Snowflake = null,
position: ?u32 = null,
permission_overwrites: []const Overwrite,
name: ?[]const u8 = null,
topic: ?[]const u8 = null,
nsfw: ?bool = null,
last_message_id: ?Snowflake = null,
bitrate: ?u32 = null,
user_limit: ?u32 = null,
rate_limit_per_user: ?u32 = null,
recipients: []const User,
icon: ?[]const u8,
owner_id: ?Snowflake = null,
application_id: ?Snowflake = null,
managed: ?bool = null,
parent_id: ?Snowflake = null,
last_pin_timestamp: ?[]const u8 = null,
rtc_region: ?[]const u8 = null,
video_quality_mode: ?VideoQualityMode = null,
message_count: ?u32 = null,
member_count: ?u32 = null,
thread_metadata: ?ThreadMetadata = null,
member: ?ThreadMember = null,
default_auto_archive_duration: ?u32 = null,
permissions: ?[]const u8 = null,
app_permissions: ?[]const u8 = null,
flags: ?u64 = null,
total_message_sent: ?u32 = null,
available_tags: ?[]const ForumTag = null,
applied_tags: ?[]const Snowflake = null,
default_reaction_emoji: ?DefaultReaction = null,
default_thread_rate_limit_per_user: ?u32 = null,
default_sort_order: ?u32 = null,
default_forum_layout: ?ForumLayoutType = null,

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
    invitable: ?bool = null,
    create_timestamp: ?[]const u8 = null,
};

pub const ThreadMember = struct {
    id: ?Snowflake = null,
    user_id: ?Snowflake = null,
    join_timestamp: []const u8,
    flags: u64,
    member: ?Guild.GuildMember = null,
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
