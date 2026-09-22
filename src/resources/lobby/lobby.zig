const std = @import("std");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const Channel = @import("../channel/channel.zig");
const User = @import("../user/user.zig");
const Message = @import("../message/message.zig");

const Lobby = @This();

id: Snowflake,
application_id: Snowflake,
metadata: ?std.StringHashMapUnmanaged([]const u8) = null,
members: []const LobbyMember,
linked_channel: ?Channel = null,

pub const LobbyMember = struct {
    id: Snowflake,
    metadata: ?std.StringHashMapUnmanaged([]const u8) = null,
    flags: ?u64 = null,
    additional_name: ?[]const u8 = null,
};

pub const LobbyMemberFlag = enum(u8) {
    can_link_lobby = 1 << 0,
};

pub const LobbyMessage = struct {
    id: Snowflake,
    type: Message.MessageType,
    content: []const u8,
    lobby_id: Snowflake,
    channel_id: Snowflake,
    author: User,
    lobby_member: ?LobbyMember = null,
    metadata: ?std.StringArrayHashMapUnmanaged([]const u8) = null,
    moderation_metadata: ?std.StringArrayHashMapUnmanaged([]const u8) = null,
    flags: u64,
    application_id: Snowflake,
};
