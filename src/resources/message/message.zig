const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Application = @import("../application/application.zig");
const Channel = @import("../channel/channel.zig");
const Sticker = @import("../sticker/sticker.zig");
const Emoji = @import("../emoji/emoji.zig");
const Poll = @import("../poll/poll.zig");

const Message = @This();

id: Snowflake,
channel_id: Snowflake,
author: User,
content: []const u8,
timestamp: []const u8,
edited_timestamp: ?[]const u8 = null,
tts: bool,
mention_everyone: bool,
mentions: []const User,
mention_roles: []const Snowflake,
mention_channels: utils.Optional([]const ChannelMention) = .missing,
attachments: []const Attachment,
embeds: []const Embed,
reactions: utils.Optional([]const Reaction) = .missing,
// nonce: TODO: support this
pinned: bool,
webhook_id: utils.Optional(Snowflake) = .missing,
type: MessageType,
activity: utils.Optional(MessageActivity) = .missing,
application: utils.Optional(utils.PartialStruct(Application)) = .missing,
application_id: utils.Optional(Snowflake) = .missing,
flags: utils.Optional(u64) = .missing,
message_reference: utils.Optional(MessageReference) = .missing,
message_snapshots: utils.Optional([]const MessageSnapshot) = .missing,
referenced_message: utils.Optional(?Message) = .missing,
// interaction_metadata: TODO: support this
// interaction: TODO: support this
thread: utils.Optional(Channel) = .missing,
// components: TODO: support this
sticker_items: utils.Optional([]const Sticker.StickerItem) = .missing,
stickers: utils.Optional([]const Sticker) = .missing,
position: utils.Optional(u32) = .missing,
role_subscription_data: utils.Optional(RoleSubscriptionData) = .missing,
// resolved: TODO: support this
poll: utils.Optional(Poll) = .missing,
call: utils.Optional(MessageCall) = .missing,
shared_client_theme: utils.Optional(SharedClientTheme) = .missing,

pub const MessageType = enum(u8) {
    default = 0,
    recipient_add = 1,
    recipient_remove = 2,
    call = 3,
    channel_name_change = 4,
    channel_icon_change = 5,
    channel_pinned_message = 6,
    user_join = 7,
    guild_boost = 8,
    guild_boost_tier_1 = 9,
    guild_boost_tier_2 = 10,
    guild_boost_tier_3 = 11,
    channel_follow_add = 12,
    guild_discovery_disqualified = 14,
    guild_discovery_requalified = 15,
    guild_discovery_grace_period_initial_warning = 16,
    guild_discovery_grace_period_final_warning = 17,
    thread_created = 18,
    reply = 19,
    chat_input_command = 20,
    thread_starter_message = 21,
    guild_invite_reminder = 22,
    context_menu_command = 23,
    auto_moderation_action = 24,
    role_subscription_purchase = 25,
    interaction_premium_upsell = 26,
    stage_start = 27,
    stage_end = 28,
    stage_speaker = 29,
    stage_topic = 31,
    guild_application_premium_subscription = 32,
    guild_incident_alert_mode_enabled = 36,
    guild_incident_alert_mode_disabled = 37,
    guild_incident_report_raid = 38,
    guild_incident_report_false_alarm = 39,
    purchase_notification = 44,
    poll_result = 46,
};

pub const MessageActivity = struct {
    type: MessageActivity,
    party_id: utils.Optional([]const u8) = .missing,
};

pub const MessageActivityType = enum(u8) {
    join = 1,
    spectate = 2,
    listen = 3,
    join_request = 5,
    stream_request = 6,
};

pub const MessageFlag = enum(u8) {
    crossposted = 1 << 0,
    is_crosspost = 1 << 1,
    suppress_embeds = 1 << 2,
    source_message_deleted = 1 << 3,
    urgent = 1 << 4,
    has_thread = 1 << 5,
    ephemeral = 1 << 6,
    loading = 1 << 7,
    failed_to_mention_some_roles_in_thread = 1 << 8,
    suppress_notifications = 1 << 12,
    is_voice_message = 1 << 13,
    has_snapshot = 1 << 14,
    is_components_v2 = 1 << 15,
};

pub const ApplicationCommandInteractionMetadata = struct {
    id: Snowflake,
    // type: TODO: support this
    user: User,
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: utils.Optional(Snowflake) = .missing,
    target_user: utils.Optional(User) = .missing,
    target_message_id: utils.Optional(Snowflake) = .missing,
};

pub const MessageComponentInteractionMetadata = struct {
    id: Snowflake,
    // type: TODO: support this
    user: User,
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: utils.Optional(Snowflake) = .missing,
    interacted_message_id: Snowflake,
};

pub const ModalSubmitInteractionMetadata = struct {
    id: Snowflake,
    // type: TODO: support this
    user: User,
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: utils.Optional(Snowflake) = .missing,
    // triggering_interaction_metadata: TODO: support this
};

pub const MessageCall = struct {
    participants: []const Snowflake,
    ended_timestamp: utils.Optional(?[]const u8) = .missing,
};

pub const MessageReference = struct {
    type: utils.Optional(MessageReferenceType) = .missing,
    message_id: utils.Optional(Snowflake) = .missing,
    channel_id: utils.Optional(Snowflake) = .missing,
    guild_id: utils.Optional(Snowflake) = .missing,
    fail_if_not_exists: utils.Optional(bool) = .missing,
};

pub const MessageReferenceType = enum(u8) {
    default = 0,
    forward = 1,
};

pub const MessageSnapshot = struct {
    message: utils.PartialStruct(Message),
};

pub const Reaction = struct {
    count: u32,
    count_details: ReactionCountDetails,
    me: bool,
    me_burst: bool,
    emoji: utils.PartialStruct(Emoji),
    // burst_colors: TODO: support this
};

pub const ReactionCountDetails = struct {
    burst: u32,
    normal: u32,
};

pub const Embed = struct {
    title: utils.Optional([]const u8) = .missing,
    type: utils.Optional(EmbedType) = .missing,
    description: utils.Optional([]const u8) = .missing,
    url: utils.Optional([]const u8) = .missing,
    timestamp: utils.Optional([]const u8) = .missing,
    color: utils.Optional(u32) = .missing,
    footer: utils.Optional(EmbedFooter) = .missing,
    image: utils.Optional(EmbedImage) = .missing,
    thumbnail: utils.Optional(EmbedImage) = .missing,
    video: utils.Optional(EmbedVideo) = .missing,
    provider: utils.Optional(EmbedProvider) = .missing,
    author: utils.Optional(EmbedAuthor) = .missing,
    fields: utils.Optional([]const EmbedField) = .missing,
    flags: utils.Optional(u64) = .missing,
};

pub const EmbedType = enum {
    rich,
    image,
    video,
    gifv,
    article,
    link,
    poll_result,
};

pub const EmbedFlag = enum(u8) {
    IS_CONTENT_INVENTORY_ENTRY = 1 << 5,
};

pub const EmbedVideo = struct {
    url: utils.Optional([]const u8) = .missing,
    proxy_url: utils.Optional([]const u8) = .missing,
    height: utils.Optional(u32) = .missing,
    width: utils.Optional(u32) = .missing,
    content_type: utils.Optional([]const u8) = .missing,
    placeholder: utils.Optional([]const u8) = .missing,
    placeholder_version: utils.Optional(u32) = .missing,
    description: utils.Optional([]const u8) = .missing,
    flags: utils.Optional(u64) = .missing,
};

pub const EmbedImage = struct {
    url: []const u8,
    proxy_url: utils.Optional([]const u8) = .missing,
    height: utils.Optional(u32) = .missing,
    width: utils.Optional(u32) = .missing,
    content_type: utils.Optional([]const u8) = .missing,
    placeholder: utils.Optional([]const u8) = .missing,
    placeholder_version: utils.Optional(u32) = .missing,
    description: utils.Optional([]const u8) = .missing,
    flags: utils.Optional(u64) = .missing,
};

pub const EmbedMediaFlag = enum(u8) {
    is_animated = 1 << 5,
};

pub const EmbedProvider = struct {
    name: utils.Optional([]const u8) = .missing,
    url: utils.Optional([]const u8) = .missing,
};

pub const EmbedAuthor = struct {
    name: []const u8,
    url: utils.Optional([]const u8) = .missing,
    icon_url: utils.Optional([]const u8) = .missing,
    proxy_icon_url: utils.Optional([]const u8) = .missing,
};

pub const EmbedFooter = struct {
    text: []const u8,
    icon_url: utils.Optional([]const u8) = .missing,
    proxy_icon_url: utils.Optional([]const u8) = .missing,
};

pub const EmbedField = struct {
    name: []const u8,
    value: []const u8,
    @"inline": utils.Optional(bool) = .missing,
};

pub const Attachment = struct {
    id: Snowflake,
    filename: []const u8,
    title: utils.Optional([]const u8) = .missing,
    description: utils.Optional([]const u8) = .missing,
    content_type: utils.Optional([]const u8) = .missing,
    size: usize,
    proxy_url: []const u8,
    height: utils.Optional(?u32) = .missing,
    width: utils.Optional(?u32) = .missing,
    placeholder: utils.Optional([]const u8) = .missing,
    placeholder_version: utils.Optional(u32) = .missing,
    ephemeral: utils.Optional(bool) = .missing,
    duration_secs: utils.Optional(f64) = .missing,
    waveform: utils.Optional([]const u8) = .missing,
    flags: utils.Optional(u64) = .missing,
    clip_participants: utils.Optional([]const User) = .missing,
    clip_created_at: utils.Optional([]const u8) = .missing,
    application: utils.Optional(?Application) = .missing,
};

pub const AttachmentRequest = struct {
    // id: TODO: support this
    filename: utils.Optional([]const u8) = .missing,
    title: utils.Optional([]const u8) = .missing,
    description: utils.Optional([]const u8) = .missing,
    duration_secs: utils.Optional(f64) = .missing,
    waveform: utils.Optional([]const u8) = .missing,
    is_spoiler: utils.Optional(bool) = .missing,
};

pub const AttachmentFlag = enum(u8) {
    is_clip = 1 << 0,
    is_thumbnail = 1 << 1,
    is_remix = 1 << 2,
    is_spoiler = 1 << 3,
    is_animated = 1 << 5,
};

pub const ChannelMention = struct {
    id: Snowflake,
    guild_id: Snowflake,
    type: Channel.ChannelType,
    name: []const u8,
};

pub const AllowedMentions = struct {
    parse: utils.Optional([]const AllowedMentionType) = .missing,
    roles: utils.Optional([]const Snowflake) = .missing,
    users: utils.Optional([]const Snowflake) = .missing,
    replied_user: utils.Optional(bool) = .missing,
};

pub const AllowedMentionType = enum { // TODO: implement json serialization and deserialization
    role_mentions,
    user_mentions,
    everyone_mentions,
};

pub const RoleSubscriptionData = struct {
    role_subscription_listing_id: Snowflake,
    tier_name: []const u8,
    total_months_subscribed: u32,
    is_renewal: bool,
};

pub const MessagePin = struct {
    pinned_at: []const u8,
    message: Message,
};

pub const SharedClientTheme = struct {
    colors: []const []const u8,
    gradient_angle: u32,
    base_mix: u32,
    base_theme: utils.Optional(?BaseThemeType) = .missing,
};

pub const BaseThemeType = enum(u8) {
    unset = 0,
    dark = 1,
    light = 2,
    darker = 3,
    midnight = 4,
};
