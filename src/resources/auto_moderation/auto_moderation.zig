const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;

const AutoModeration = @This();

id: Snowflake,
guild_id: Snowflake,
name: []const u8,
creator_id: Snowflake,
event_type: EventType,
trigger_type: TriggerType,
trigger_metadata: TriggerMetadata,
actions: []const AutoModerationAction,
enabled: bool,
exempt_roles: []const Snowflake,
exempt_channels: []const Snowflake,

pub const TriggerType = enum(u8) {
    keyword = 1,
    spam = 3,
    keyword_preset = 4,
    mention_spam = 5,
    member_profile = 6,
};

pub const TriggerMetadata = struct {
    keyword_filter: []const []const u8,
    regex_patterns: []const []const u8,
    presets: []const KeywordPresetType,
    allow_list: []const []const u8,
    mention_total_limit: u32,
    mention_raid_protection_enabled: bool,
};

pub const KeywordPresetType = enum(u8) {
    profanity = 1,
    sexual_content = 2,
    slurs = 3,
};

pub const EventType = enum(u8) {
    message_send = 1,
    member_update = 2,
};

pub const AutoModerationAction = struct {
    type: ActionType,
    metadata: utils.Optional(ActionMetadata) = .missing,
};

pub const ActionType = enum(u8) {
    block_message = 1,
    send_alert_message = 2,
    timeout = 3,
    block_member_interaction = 4,
};

pub const ActionMetadata = struct {
    channel_id: Snowflake,
    duration_seconds: u32,
    custom_message: utils.Optional(?[]const u8) = .missing,
};
