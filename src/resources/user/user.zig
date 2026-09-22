const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake.zig").Snowflake;
const Guild = @import("../guild/guild.zig");
const ApplicationRoleConnectionMetadata = @import("../application_role_connection_metadata/application_role_connection_metadata.zig");

const User = @This();

id: Snowflake,
username: []const u8,
discriminator: []const u8,
global_name: ?[]const u8 = null,
avatar: ?[]const u8,
bot: ?bool = null,
system: ?bool = null,
mfa_enabled: ?bool = null,
banner: ?[]const u8 = null,
accent_color: ?u32 = null,
locale: ?[]const u8 = null,
verified: ?bool = null,
email: ?[]const u8 = null,
flags: ?u64 = null,
premium_type: ?u8 = null,
public_flags: ?u64 = null,
avatar_decoration_data: ?AvatarDecorationData = null,
collectibles: ?Collectible = null,
primary_guild: ?PrimaryGuild = null,

pub const UserFlag = enum(u32) {
    STAFF = 1 << 0,
    PARTNER = 1 << 1,
    HYPESQUAD = 1 << 2,
    BUG_HUNTER_LEVEL_1 = 1 << 3,
    HYPESQUAD_ONLINE_HOUSE_1 = 1 << 6,
    HYPESQUAD_ONLINE_HOUSE_2 = 1 << 7,
    HYPESQUAD_ONLINE_HOUSE_3 = 1 << 8,
    PREMIUM_EARLY_SUPPORTER = 1 << 9,
    TEAM_PSEUDO_USER = 1 << 10,
    BUG_HUNTER_LEVEL_2 = 1 << 14,
    VERIFIED_BOT = 1 << 16,
    VERIFIED_DEVELOPER = 1 << 17,
    CERTIFIED_MODERATOR = 1 << 18,
    BOT_HTTP_INTERACTIONS = 1 << 19,
};

pub const PremiumType = enum(u8) {
    none = 0,
    nitro_classic = 1,
    nitro = 2,
    nitro_basic = 3,
};

pub const PrimaryGuild = struct {
    identity_guild_id: ?Snowflake = null,
    identity_enabled: ?bool = null,
    tag: ?[]const u8,
    badge: ?[]const u8,
};

pub const AvatarDecorationData = struct {
    asset: []const u8,
    sku_id: Snowflake,
};

pub const Collectible = struct {
    nameplate: ?Nameplate = null,
};

pub const Nameplate = struct {
    sku_id: Snowflake,
    asset: []const u8,
    label: []const u8,
    palette: []const u8, // TODO: create palette enum
};

pub const Connection = struct {
    id: []const u8,
    name: []const u8,
    type: []const u8,
    revoked: ?bool = null,
    integrations: ?[]const PartialStruct(Guild.Integration) = null, // TODO: review
    verified: bool,
    friend_sync: bool,
    show_activity: bool,
    two_way_link: bool,
    visibility: u8,

    pub const Visibility = enum(u8) {
        none = 0,
        everyone = 1,
    };
};

pub const ApplicationRoleConnection = struct {
    platform_name: ?[]const u8 = null,
    metadata: ApplicationRoleConnectionMetadata, // TODO: review
};
