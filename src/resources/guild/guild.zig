const utils = @import("zigcord-utils");

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
icon_hash: utils.Optional(?[]const u8) = .missing,
splash: ?[]const u8 = null,
discovery_splash: ?[]const u8 = null,
owner: utils.Optional(bool) = .missing,
owner_id: Snowflake,
permissions: utils.Optional([]const u8) = .missing,
region: utils.Optional(?[]const u8) = .missing,
afk_channel_id: ?Snowflake = null,
afk_timeout: u32,
widget_enabled: utils.Optional(bool) = .missing,
widget_channel_id: utils.Optional(?Snowflake) = .missing,
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
max_presences: utils.Optional(?u32) = .missing,
max_members: utils.Optional(u32) = .missing,
vanity_url_code: ?[]const u8 = null,
description: ?[]const u8 = null,
banner: ?[]const u8 = null,
premium_tier: PremiumTier,
premium_subscription_count: utils.Optional(u32) = .missing,
preferred_locale: []const u8,
public_updates_channel_id: ?Snowflake = null,
max_video_channel_users: utils.Optional(u32) = .missing,
max_stage_video_channel_users: utils.Optional(u32) = .missing,
approximate_member_count: utils.Optional(u32) = .missing,
approximate_presence_count: utils.Optional(u32) = .missing,
welcome_screen: utils.Optional(WelcomeScreen) = .missing,
nsfw_level: GuildAgeRestrictionLevel,
stickers: utils.Optional([]const Sticker) = .missing,
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
    channels: []const utils.PartialStruct(Channel),
    members: []const utils.PartialStruct(User),
    presence_count: u32,
};

pub const GuildMember = struct {
    user: utils.Optional(User) = .missing,
    nick: utils.Optional(?[]const u8) = .missing,
    avatar: utils.Optional(?[]const u8) = .missing,
    banner: utils.Optional(?[]const u8) = .missing,
    roles: []const Snowflake,
    joined_at: ?[]const u8 = null,
    premium_since: utils.Optional(?[]const u8) = .missing,
    deaf: bool,
    mute: bool,
    flags: u64,
    pending: utils.Optional(bool) = .missing,
    permissions: utils.Optional([]const u8) = .missing,
    communication_disabled_until: utils.Optional(?[]const u8) = .missing,
    avatar_decoration_data: utils.Optional(?User.AvatarDecorationData) = .missing,
    collectibles: utils.Optional(?User.Collectible) = .missing,
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
    syncing: utils.Optional(bool) = .missing,
    role_id: utils.Optional(Snowflake) = .missing,
    enable_emoticons: utils.Optional(bool) = .missing,
    expire_behavior: utils.Optional(IntegrationExpireBehavior) = .missing,
    expire_grace_period: utils.Optional(u32) = .missing,
    user: utils.Optional(User) = .missing,
    account: IntegrationAccount,
    synced_at: utils.Optional([]const u8) = .missing,
    subscriber_count: utils.Optional(u32) = .missing,
    revoked: utils.Optional(bool) = .missing,
    application: utils.Optional(IntegrationApplication) = .missing,
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
    bot: utils.Optional(User) = .missing,
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
    emoji: utils.Optional(Emoji) = .missing,
    emoji_id: utils.Optional(Snowflake) = .missing,
    emoji_name: utils.Optional([]const u8) = .missing,
    emoji_animated: utils.Optional(bool) = .missing,
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
    dm_spam_detected_at: utils.Optional(?[]const u8) = .missing,
    raid_detected_at: utils.Optional(?[]const u8) = .missing,
};
