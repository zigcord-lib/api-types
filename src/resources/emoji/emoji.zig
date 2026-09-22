const Snowflake = @import("../../snowflake.zig").Snowflake;
const User = @import("../user/user.zig");

const Emoji = @This();

id: ?Snowflake = null,
name: ?[]const u8 = null,
// roles: TODO: support this
user: ?User = null,
require_colons: ?bool = null,
managed: ?bool = null,
animated: ?bool = null,
available: ?bool = null,
