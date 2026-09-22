const Snowflake = @import("../../snowflake.zig").Snowflake;

pub const ApplicationRoleConnection = @import("./application_role_connection.zig");
pub const AvatarDecorationData = @import("./avatar_decoration_data.zig");
pub const Collectible = @import("./collectible.zig");
pub const Connection = @import("./connection.zig");
pub const Nameplate = @import("./nameplate.zig");
pub const PremiumType = @import("./premium_type.zig");
pub const PrimaryGuild = @import("./primary_guild.zig");
pub const UserFlag = @import("./user_flag.zig");

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
