const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");
const Team = @import("../../team/team.zig");

const Application = @This();

id: Snowflake,
name: []const u8,
icon: ?[]const u8 = null,
description: []const u8,
rpc_origins: utils.Optional([]const []const u8) = .missing,
bot_public: bool,
bot_require_code_grant: bool,
bot: utils.Optional(utils.PartialStruct(User)) = .missing,
terms_of_service_url: utils.Optional([]const u8) = .missing,
privacy_policy_url: utils.Optional([]const u8) = .missing,
owner: utils.Optional(utils.PartialStruct(User)) = .missing,
verify_key: []const u8,
team: ?Team = null,
guild_id: utils.Optional(Snowflake) = .missing,
guild: utils.Optional(utils.PartialStruct(Guild)) = .missing,
primary_sku_id: utils.Optional(Snowflake) = .missing,
slug: utils.Optional([]const u8) = .missing,
cover_image: utils.Optional([]const u8) = .missing,
flags: utils.Optional(u64) = .missing, // TODO: create flag enum
flags_new: utils.Optional([]const u8), // TODO: create flag enum
approximate_guild_count: utils.Optional(u32) = .missing,
approximate_user_install_count: utils.Optional(u32) = .missing,
approximate_user_authorization_count: utils.Optional(u32) = .missing,
redirect_uris: utils.Optional([]const []const u8) = .missing,
interactions_endpoint_url: utils.Optional(?[]const u8) = .missing,
role_connections_verification_url: utils.Optional(?[]const u8) = .missing,
event_webhooks_url: utils.Optional(?[]const u8) = .missing,
event_webhooks_status: utils.Optional(ApplicationEventWebhookStatus) = .missing,
event_webhooks_types: utils.Optional([]const []const u8) = .missing,
tags: utils.Optional([]const []const u8) = .missing,
install_params: utils.Optional(InstallParams) = .missing,
// integration_types_config: TODO: support this
custom_install_url: utils.Optional([]const u8) = .missing,

pub const ApplicationIntegrationType = enum(u8) {
    guild_install = 0,
    user_install = 1,
};

pub const ApplicationIntegrationTypeConfiguration = struct {
    oauth2_install_params: utils.Optional(InstallParams) = .missing,
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
    guild_id: utils.Optional(?Snowflake) = .missing,
};

pub const ActivityLocationKind = enum {
    gc,
    pc,
};
