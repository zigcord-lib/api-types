const Snowflake = @import("../../snowflake.zig").Snowflake;

id: Snowflake,
channel_id: Snowflake,
// author: TODO: support this
content: []const u8,
timestamp: []const u8,
edited_timestamp: ?[]const u8 = null,
tts: bool,
mention_everyone: bool,
// mentions: TODO: support this
mention_roles: []const Snowflake,
// mention_channels: TODO: support this
// attachments: TODO: support this
// embeds: TODO: support this
// reactions: TODO: support this
// nonce: TODO: support this
pinned: bool,
webhook_id: ?Snowflake = null,
// type: TODO: support this
// activity: TODO: support this
// application: TODO: support this
application_id: ?Snowflake = null,
// flags: TODO: support this
// message_reference: TODO: support this
// message_snapshots: TODO: support this
// referenced_message: TODO: support this
// interaction_metadata: TODO: support this
// interaction: TODO: support this
// thread: TODO: support this
// components: TODO: support this
// sticker_items: TODO: support this
// stickers: TODO: support this
position: ?u32 = null,
// role_subscription_data: TODO: support this
// resolved: TODO: support this
// poll: TODO: support this
// call: TODO: support this
// shared_client_theme: TODO: support this

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
    // type: TODO: support this
    party_id: ?[]const u8 = null,
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
    // user: TODO: support this
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: ?Snowflake = null,
    // target_user: TODO: support this
    target_message_id: ?Snowflake = null,
};

pub const MessageComponentInteractionMetadata = struct {
    id: Snowflake,
    // type: TODO: support this
    // user: TODO: support this
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: ?Snowflake = null,
    interacted_message_id: Snowflake,
};

pub const ModalSubmitInteractionMetadata = struct {
    id: Snowflake,
    // type: TODO: support this
    // user: TODO: support this
    // authorizing_integration_owners: TODO: support this
    original_response_message_id: ?Snowflake = null,
    // triggering_interaction_metadata: TODO: support this
};

pub const MessageCall = struct {
    participants: []const Snowflake,
    ended_timestamp: ?[]const u8 = null,
};

pub const MessageReference = struct {
    // type: TODO: support this
    message_id: ?Snowflake = null,
    channel_id: ?Snowflake = null,
    guild_id: ?Snowflake = null,
    fail_if_not_exists: ?bool = null,
};

pub const MessageReferenceType = enum(u8) {
    default = 0,
    forward = 1,
};

pub const MessageSnapshot = struct {
    // message: TODO: support this
};

pub const Reaction = struct {
    count: u32,
    // count_details: TODO: support this
    me: bool,
    me_burst: bool,
    // emoji: TODO: support this
    // burst_colors: TODO: support this
};

pub const ReactionCountDetails = struct {
    burst: u32,
    normal: u32,
};

pub const Embed = struct {
    title: ?[]const u8 = null,
    // type: TODO: support this
    description: ?[]const u8 = null,
    url: ?[]const u8 = null,
    timestamp: ?[]const u8 = null,
    color: ?u32 = null,
    // footer: TODO: support this
    // image: TODO: support this
    // thumbnail: TODO: support this
    // video: TODO: support this
    // provider: TODO: support this
    // author: TODO: support this
    // fields: TODO: support this
    // flags: TODO: support this
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
    url: ?[]const u8 = null,
    proxy_url: ?[]const u8 = null,
    height: ?u32 = null,
    width: ?u32 = null,
    content_type: ?[]const u8 = null,
    placeholder: ?[]const u8 = null,
    placeholder_version: ?u32 = null,
    description: ?[]const u8 = null,
    // flags: TODO: support this
};

pub const EmbedImage = struct {
    url: []const u8,
    proxy_url: ?[]const u8 = null,
    height: ?u32 = null,
    width: ?u32 = null,
    content_type: ?[]const u8 = null,
    placeholder: ?[]const u8 = null,
    placeholder_version: ?u32 = null,
    description: ?[]const u8 = null,
    // flags: TODO: support this
};

pub const EmbedMediaFlag = enum(u8) {
    is_animated = 1 << 5,
};

pub const EmbedProvider = struct {
    name: ?[]const u8 = null,
    url: ?[]const u8 = null,
};

pub const EmbedAuthor = struct {
    name: []const u8,
    url: ?[]const u8 = null,
    icon_url: ?[]const u8 = null,
    proxy_icon_url: ?[]const u8 = null,
};

pub const EmbedFooter = struct {
    text: []const u8,
    icon_url: ?[]const u8 = null,
    proxy_icon_url: ?[]const u8 = null,
};

pub const EmbedField = struct {
    name: []const u8,
    value: []const u8,
    @"inline": ?bool = null,
};

pub const Attachment = struct {
    id: Snowflake,
    filename: []const u8,
    title: ?[]const u8 = null,
    description: ?[]const u8 = null,
    content_type: ?[]const u8 = null,
    size: usize,
    proxy_url: []const u8,
    height: ?u32 = null,
    width: ?u32 = null,
    placeholder: ?[]const u8 = null,
    placeholder_version: ?u32 = null,
    ephemeral: ?bool = null,
    duration_secs: ?f64 = null,
    waveform: ?[]const u8 = null,
    // flags: TODO: support this
    // clip_participants: TODO: support this
    clip_created_at: ?[]const u8 = null,
    // application: TODO: support this
};

pub const AttachmentRequest = struct {
    // id: TODO: support this
    filename: ?[]const u8 = null,
    title: ?[]const u8 = null,
    description: ?[]const u8 = null,
    duration_secs: ?f64 = null,
    waveform: ?[]const u8 = null,
    is_spoiler: ?bool = null,
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
    // type: TODO: support this
    name: []const u8,
};

pub const AllowedMentions = struct {
    // parse: TODO: support this
    roles: ?[]const Snowflake = null,
    users: ?[]const Snowflake = null,
    replied_user: ?bool = null,
};

pub const AllowedMentionType = enum {
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
    // message: TODO: support this
};

pub const SharedClientTheme = struct {
    colors: []const []const u8,
    gradient_angle: u32,
    base_mix: u32,
    // base_theme: TODO: support this

};

pub const BaseThemeTypes = enum(u8) {
    unset = 0,
    dark = 1,
    light = 2,
    darker = 3,
    midnight = 4,
};
