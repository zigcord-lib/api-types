id: []const u8,
name: []const u8,
type: []const u8,
revoked: ?bool = null,
// integrations: TODO: support this
verified: bool,
friend_sync: bool,
show_activity: bool,
two_way_link: bool,
visibility: u8,

pub const Visibility = enum(u8) {
    none = 0,
    everyone = 1,
};
