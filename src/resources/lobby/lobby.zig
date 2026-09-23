const std = @import("std");

const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const Channel = @import("../channel/channel.zig");
const User = @import("../user/user.zig");
const Message = @import("../message/message.zig");

const Lobby = @This();

id: Snowflake,
application_id: Snowflake,
metadata: ?std.StringHashMapUnmanaged([]const u8) = null,
members: []const LobbyMember,
linked_channel: utils.Optional(Channel) = .missing,

pub const LobbyMember = struct {
    id: Snowflake,
    metadata: utils.Optional(?std.StringHashMapUnmanaged([]const u8)) = .missing,
    flags: utils.Optional(u64) = .missing,
    additional_name: utils.Optional([]const u8) = .missing,
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
    lobby_member: utils.Optional(LobbyMember) = .missing,
    metadata: utils.Optional(?std.StringArrayHashMapUnmanaged([]const u8)) = .missing,
    moderation_metadata: utils.Optional(?std.StringArrayHashMapUnmanaged([]const u8)) = .missing,
    flags: u64,
    application_id: Snowflake,
};
