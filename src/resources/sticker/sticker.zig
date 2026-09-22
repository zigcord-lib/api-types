const Snowflake = @import("../../snowflake.zig");

id: Snowflake,
pack_id: ?Snowflake = null,
name: []const u8 = null,
description: ?[]const u8 = null,
tags: []const u8,
// type: TODO: support this
// format_type: TODO: support this
available: ?bool = null,
guild_id: ?Snowflake = null,
// user: TODO: support this
sort_value: ?u32 = null,

pub const StickerType = enum(u8) {
    standard = 1,
    guild = 2,
};

pub const StickerFormatType = enum(u8) {
    png = 1,
    apng = 2,
    lottie = 3,
    gif = 4,
};

pub const StickerItem = struct {
    id: Snowflake,
    name: []const u8,
    // format_type: TODO: support this
};

pub const StickerPack = struct {
    id: Snowflake,
    // stickers: TODO: support this
    name: []const u8,
    sku_id: Snowflake,
    cover_sticker_id: ?Snowflake = null,
    description: []const u8,
    banner_asset_id: ?Snowflake = null,
};
