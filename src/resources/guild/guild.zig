const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const Emoji = @import("../emoji/emoji.zig");
const Sticker = @import("../sticker/sticker.zig");
const Channel = @import("../channel/channel.zig");
const User = @import("../user/user.zig");
const Role = @import("../../role/role.zig");

const Guild = @This();

id: Snowflake,
name: []const u8,
icon: ?[]const u8 = null,
icon_hash: ?[]const u8 = null,
splash: ?[]const u8 = null,
discovery_splash: ?[]const u8 = null,
owner: ?bool = null,
owner_id: Snowflake,
permissions: ?[]const u8 = null,
region: ?[]const u8 = null,
afk_channel_id: ?Snowflake = null,
afk_timeout: u32,
widget_enabled: ?bool = null,
widget_channel_id: ?Snowflake = null,
verification_level: VerificationLevel,
default_message_notifications: DefaultMessageNotificationLevel,
explicit_content_filter: ExplicitContentFilterLevel,
roles: []const Role,
emojis: []const Emoji,
features: []const GuildFeature,
mfa_level: MFALevel,
application_id: ?Snowflake = null,
system_channel_id: ?Snowflake = null,
system_channel_flags: u64,
rules_channel_id: ?Snowflake = null,
max_presences: ?u32 = null,
max_members: ?u32 = null,
vanity_url_code: ?[]const u8 = null,
description: ?[]const u8 = null,
banner: ?[]const u8 = null,
premium_tier: PremiumTier,
premium_subscription_count: ?u32 = null,
preferred_locale: []const u8,
public_updates_channel_id: ?Snowflake = null,
max_video_channel_users: ?u32 = null,
max_stage_video_channel_users: ?u32 = null,
approximate_member_count: ?u32 = null,
approximate_presence_count: ?u32 = null,
welcome_screen: ?WelcomeScreen = null,
nsfw_level: GuildAgeRestrictionLevel,
stickers: ?[]const Sticker = null,
premium_progress_bar_enabled: bool,
safety_alerts_channel_id: ?Snowflake = null,
incidents_data: ?IncidentsData = null,

pub const DefaultMessageNotificationLevel = enum(u8) {
    all_messages = 0,
    only_mentions = 1,
};

pub const ExplicitContentFilterLevel = enum(u8) {
    disabled = 0,
    members_without_roles = 1,
    all_members = 2,
};

pub const MFALevel = enum(u8) {
    none = 0,
    elevated = 1,
};

pub const VerificationLevel = enum(u8) {
    none = 0,
    low = 1,
    medium = 2,
    high = 3,
    very_high = 4,
};

pub const GuildAgeRestrictionLevel = enum(u8) {
    default = 0,
    explicit = 1,
    safe = 2,
    age_restricted = 3,
};

pub const PremiumTier = enum(u8) {
    none = 0,
    tier_1 = 1,
    tier_2 = 2,
    tier_3 = 3,
};

pub const SystemChannelFlag = enum(u8) {
    suppress_join_notifications = 1 << 0,
    suppress_premium_subscriptions = 1 << 1,
    suppress_guild_reminder_notifications = 1 << 2,
    suppress_join_notification_replies = 1 << 3,
    suppress_role_subscription_purchase_notifications = 1 << 4,
    suppress_role_subscription_purchase_notification_replies = 1 << 5,
};

pub const GuildFeature = enum {
    animated_banner,
    animated_icon,
    application_command_permissions_v2,
    auto_moderation,
    banner,
    community,
    creator_monetizable_provisional,
    creator_store_page,
    developer_support_server,
    discoverable,
    enhanced_role_colors,
    featurable,
    guild_tags,
    guests_enabled,
    invites_disabled,
    invite_splash,
    member_verification_gate_enabled,
    more_soundboard,
    more_stickers,
    news,
    partnered,
    preview_enabled,
    prune_requires_admin,
    raid_alerts_disabled,
    role_icons,
    role_subscriptions_available_for_purchase,
    role_subscriptions_enabled,
    soundboard,
    ticketed_events_enabled,
    vanity_url,
    verified,
    vip_regions,
    welcome_screen_enabled,
};

pub const MutableGuildFeature = enum {
    community,
    discoverable,
    invites_disabled,
    raid_alerts_disabled,
};

pub const UnavailableGuild = struct {
    id: Snowflake,
    unavailable: bool,
};

pub const GuildPreview = struct {
    id: Snowflake,
    name: []const u8,
    icon: ?[]const u8 = null,
    splash: ?[]const u8 = null,
    discovery_splash: ?[]const u8 = null,
    emojis: []const Emoji,
    features: []const GuildFeature,
    approximate_member_count: u32,
    approximate_presence_count: u32,
    description: ?[]const u8 = null,
    stickers: []const Sticker,
};

pub const GuildWidgetSettings = struct {
    enabled: bool,
    channel_id: ?Snowflake = null,
};

pub const GuildWidget = struct {
    id: Snowflake,
    name: []const u8,
    instant_invite: ?[]const u8 = null,
    channels: []const PartialStruct(Channel),
    members: []const PartialStruct(User),
    presence_count: u32,
};

pub const GuildMember = struct {
    user: ?User = null,
    nick: ?[]const u8 = null,
    avatar: ?[]const u8 = null,
    banner: ?[]const u8 = null,
    roles: []const Snowflake,
    joined_at: ?[]const u8 = null,
    premium_since: ?[]const u8 = null,
    deaf: bool,
    mute: bool,
    flags: u64,
    pending: ?bool = null,
    permissions: ?[]const u8 = null,
    communication_disabled_until: ?[]const u8 = null,
    avatar_decoration_data: ?User.AvatarDecorationData = null,
    collectibles: ?User.Collectible = null,
};

pub const GuildMemberFlag = enum(u8) {
    did_rejoin = 1 << 0,
    completed_onboarding = 1 << 1,
    bypasses_verification = 1 << 2,
    started_onboarding = 1 << 3,
    is_guest = 1 << 4,
    started_home_actions = 1 << 5,
    completed_home_actions = 1 << 6,
    automod_quarantined_username = 1 << 7,
    dm_settings_upsell_acknowledged = 1 << 9,
    automod_quarantined_guild_tag = 1 << 10,
};

pub const Integration = struct {
    id: Snowflake,
    name: []const u8,
    type: []const u8,
    enabled: bool,
    syncing: ?bool = null,
    role_id: ?Snowflake = null,
    enable_emoticons: ?bool = null,
    expire_behavior: ?IntegrationExpireBehavior = null,
    expire_grace_period: ?u32 = null,
    user: ?User = null,
    account: IntegrationAccount,
    synced_at: ?[]const u8 = null,
    subscriber_count: ?u32 = null,
    revoked: ?bool = null,
    application: IntegrationApplication,
    // scopes: TODO: support this
};

pub const IntegrationExpireBehavior = enum(u8) {
    remove_role = 0,
    kick = 1,
};

pub const IntegrationAccount = struct {
    id: Snowflake,
    name: []const u8,
};

pub const IntegrationApplication = struct {
    id: Snowflake,
    name: []const u8,
    icon: ?[]const u8 = null,
    description: []const u8,
    bot: ?User = null,
};

pub const Ban = struct {
    reason: ?[]const u8 = null,
    user: User,
};

pub const WelcomeScreen = struct {
    description: ?[]const u8 = null,
    welcome_channels: []const WelcomeScreenChannel,
};

pub const WelcomeScreenChannel = struct {
    channel_id: Snowflake,
    description: []const u8,
    emoji_id: ?Snowflake = null,
    emoji_name: ?[]const u8 = null,
};

pub const GuildOnboarding = struct {
    guild_id: Snowflake,
    prompts: []const OnboardingPrompt,
    default_channel_ids: []const Snowflake,
    enabled: bool,
    mode: OnboardingMode,
};

pub const OnboardingPrompt = struct {
    id: Snowflake,
    type: PromptType,
    options: []const PromptOption,
    title: []const u8,
    single_select: bool,
    required: bool,
    in_onboarding: bool,
};

pub const PromptOption = struct {
    id: Snowflake,
    channel_ids: []const Snowflake,
    role_ids: []const Snowflake,
    emoji: ?Emoji = null,
    emoji_id: ?Snowflake = null,
    emoji_name: ?[]const u8 = null,
    emoji_animated: ?bool = null,
    title: []const u8,
    description: ?[]const u8 = null,
};

pub const OnboardingMode = enum(u8) {
    onboarding_default = 0,
    onboarding_advanced = 1,
};

pub const PromptType = enum(u8) {
    multiple_choice = 0,
    dropdown = 1,
};

pub const IncidentsData = struct {
    invites_disabled_until: ?[]const u8 = null,
    dms_disabled_until: ?[]const u8 = null,
    dm_spam_detected_at: ?[]const u8 = null,
    raid_detected_at: ?[]const u8 = null,
};
