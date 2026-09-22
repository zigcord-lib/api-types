const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");
const Team = @import("../../team.zig");

const Application = @This();

id: Snowflake,
name: []const u8,
icon: ?[]const u8 = null,
description: []const u8,
rpc_origins: ?[]const []const u8 = null,
bot_public: bool,
bot_require_code_grant: bool,
bot: ?PartialStruct(User) = null,
terms_of_service_url: ?[]const u8 = null,
privacy_policy_url: ?[]const u8 = null,
owner: ?PartialStruct(User) = null,
verify_key: []const u8,
team: ?Team = null,
guild_id: ?Snowflake = null,
guild: ?PartialStruct(Guild) = null,
primary_sku_id: ?Snowflake = null,
slug: ?[]const u8 = null,
cover_image: ?[]const u8 = null,
flags: ?u64 = null, // TODO: create flag enum
flags_new: ?[]const u8, // TODO: create flag enum
approximate_guild_count: ?u32 = null,
approximate_user_install_count: ?u32 = null,
approximate_user_authorization_count: ?u32 = null,
redirect_uris: ?[]const []const u8 = null,
interactions_endpoint_url: ?[]const u8 = null,
role_connections_verification_url: ?[]const u8 = null,
event_webhooks_url: ?[]const u8 = null,
event_webhooks_status: ?ApplicationEventWebhookStatus = null,
event_webhooks_types: ?[]const []const u8 = null,
tags: ?[]const []const u8 = null,
install_params: ?InstallParams = null,
// integration_types_config: TODO: support this
custom_install_url: ?[]const u8 = null,

pub const ApplicationIntegrationType = enum(u8) {
    guild_install = 0,
    user_install = 1,
};

pub const ApplicationIntegrationTypeConfiguration = struct {
    oauth2_install_params: ?InstallParams = null,
};

pub const ApplicationEventWebhookStatus = enum(u8) {
    disabled = 1,
    enabled = 2,
    disabled_by_discord = 3,
};

pub const ApplicationFlag = enum(u8) {
    application_auto_moderation_rule_create_badge = 1 << 6,
    gateway_presence = 1 << 12,
    gateway_presence_limited = 1 << 13,
    gateway_guild_members = 1 << 14,
    gateway_guild_members_limited = 1 << 15,
    verification_pending_guild_limit = 1 << 16,
    embedded = 1 << 17,
    gateway_message_content = 1 << 18,
    gateway_message_content_limited = 1 << 19,
    application_command_badge = 1 << 23,
};

pub const InstallParams = struct {
    scopes: []const []const u8, // TODO: create scope enum
    permissions: []const u8,
};

pub const ActivityInstance = struct {
    application_id: Snowflake,
    instance_id: []const u8,
    launch_id: Snowflake,
    location: ActivityLocation,
    users: []const Snowflake,
};

pub const ActivityLocation = struct {
    id: []const u8,
    kind: ActivityLocationKind,
    channel_id: Snowflake,
    guild_id: ?Snowflake = null,
};

pub const ActivityLocationKind = enum {
    gc,
    pc,
};
