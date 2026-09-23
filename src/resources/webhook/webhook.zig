const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");
const Channel = @import("../channel/channel.zig");

const Webhook = @This();

id: Snowflake,
type: WebhookType,
guild_id: utils.Optional(?Snowflake) = .missing,
channel_id: ?Snowflake = null,
user: utils.Optional(User) = .missing,
name: ?[]const u8 = null,
avatar: ?[]const u8 = null,
token: utils.Optional([]const u8) = .missing,
application_id: ?Snowflake = null,
source_guild: utils.Optional(utils.PartialStruct(Guild)) = .missing,
source_channel: utils.Optional(utils.PartialStruct(Channel)) = .missing,
url: utils.Optional([]const u8) = .missing,

pub const WebhookType = enum(u8) {
    incoming = 1,
    channel_follower = 2,
    application = 3,
};
