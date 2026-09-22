const Snowflake = @import("../../snowflake.zig").Snowflake;

sku_id: Snowflake,
asset: []const u8,
label: []const u8,
palette: []const u8, // TODO: create palette enum
