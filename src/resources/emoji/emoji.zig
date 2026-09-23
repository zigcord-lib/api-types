const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");

const Emoji = @This();

id: ?Snowflake = null,
name: ?[]const u8 = null,
roles: utils.Optional([]const Snowflake) = .missing,
user: utils.Optional(User) = .missing,
require_colons: utils.Optional(bool) = .missing,
managed: utils.Optional(bool) = .missing,
animated: utils.Optional(bool) = .missing,
available: utils.Optional(bool) = .missing,
