const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const User = @import("../user/user.zig");

const Soundboard = @This();

name: []const u8,
sound_id: Snowflake,
volume: f64,
emoji_id: ?Snowflake = null,
emoji_name: ?[]const u8 = null,
guild_id: utils.Optional(Snowflake) = .missing,
available: bool,
user: utils.Optional(User) = .missing,
