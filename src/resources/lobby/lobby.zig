const std = @import("std");

const Snowflake = @import("../../snowflake.zig").Snowflake;

id: Snowflake,
application_id: Snowflake,
metadata: ?std.StringHashMapUnmanaged([]const u8) = null,
// members: TODO: support this
// linked_channel: TODO: support this

pub const LobbyMember = struct {
    id: Snowflake,
    metadata: ?std.StringHashMapUnmanaged([]const u8) = null,
    // flags: TODO: support this
    additional_name: ?[]const u8 = null,
};

pub const LobbyMemberFlag = enum(u8) {
    can_link_lobby = 1 << 0,
};

pub const LobbyMessage = struct {
    id: Snowflake,
    // type: TODO: support this
    content: []const u8,
    lobby_id: Snowflake,
    channel_id: Snowflake,
    // author: TODO: support this
    // lobby_member: TODO: support this
    metadata: ?std.StringArrayHashMapUnmanaged([]const u8) = null,
    moderation_metadata: ?std.StringArrayHashMapUnmanaged([]const u8) = null,
    // flags: TODO: support this
    application_id: Snowflake,
};
