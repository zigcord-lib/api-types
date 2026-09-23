const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig");
const User = @import("../user/user.zig");

const Sticker = @This();

id: Snowflake,
pack_id: utils.Optional(Snowflake) = .missing,
name: []const u8 = null,
description: ?[]const u8 = null,
tags: []const u8,
type: StickerType,
format_type: StickerFormatType,
available: utils.Optional(bool) = .missing,
guild_id: utils.Optional(Snowflake) = .missing,
user: utils.Optional(User) = .missing,
sort_value: utils.Optional(u32) = .missing,

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
    format_type: StickerFormatType,
};

pub const StickerPack = struct {
    id: Snowflake,
    stickers: []const Sticker,
    name: []const u8,
    sku_id: Snowflake,
    cover_sticker_id: utils.Optional(Snowflake) = .missing,
    description: []const u8,
    banner_asset_id: utils.Optional(Snowflake) = .missing,
};
