const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");
const Channel = @import("../channel/channel.zig");

const Webhook = @This();

id: Snowflake,
type: WebhookType,
guild_id: ?Snowflake = null,
channel_id: ?Snowflake = null,
user: ?User = null,
name: ?[]const u8 = null,
avatar: ?[]const u8 = null,
token: ?[]const u8 = null,
application_id: ?Snowflake = null,
source_guild: ?PartialStruct(Guild) = null,
source_channel: ?PartialStruct(Channel) = null,
url: ?[]const u8 = null,

pub const WebhookType = enum(u8) {
    incoming = 1,
    channel_follower = 2,
    application = 3,
};
