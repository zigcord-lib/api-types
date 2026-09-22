const Snowflake = @import("../../snowflake.zig").Snowflake;

id: ?Snowflake = null,
name: ?[]const u8 = null,
// roles: TODO: support this
// user: TODO: support this
require_colons: ?bool = null,
managed: ?bool = null,
animated: ?bool = null,
available: ?bool = null,
