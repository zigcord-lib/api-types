const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("./snowflake.zig").Snowflake;
const User = @import("./resources/user/user.zig");

const Team = @This();

icon: ?[]const u8 = null,
id: Snowflake,
members: []const TeamMember,
name: []const u8,
owner_user_id: Snowflake,

pub const TeamMember = struct {
    membership_state: u8,
    team_id: Snowflake,
    user: PartialStruct(User),
    role: []const u8,
};

pub const MembershipState = enum(u8) {
    invited = 1,
    accepted = 2,
};

pub const TeamMemberRoleType = enum {
    admin,
    developer,
    read_only,
};
