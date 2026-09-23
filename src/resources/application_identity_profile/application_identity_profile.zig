const utils = @import("zigcord-utils");

const ApplicationIdentityProfile = @This();

username: ?[]const u8 = null,
// metadata: TODO: support this
data: ?ProfileData = null,

pub const ProfileData = struct {
    primary: utils.Optional(PrimaryProfileData) = .missing,
    dynamic: utils.Optional([]DynamicField) = .missing,
};

pub const PrimaryProfileData = struct {
    season: utils.Optional([]const u8) = .missing,
    rank_name: utils.Optional([]const u8) = .missing,
    rank_image: utils.Optional(Media) = .missing,
    highest_rank: utils.Optional([]const u8) = .missing,
    highest_rank_image: utils.Optional(Media) = .missing,
    featured_played_character: utils.Optional([]const u8) = .missing,
    featured_played_character_image: utils.Optional(Media) = .missing,
    playtime_hours: utils.Optional(f64) = .missing,
    total_wins: utils.Optional(u32) = .missing,
    current_period_wins: utils.Optional(u32) = .missing,
    total_games: utils.Optional(u32) = .missing,
    current_period_games: utils.Optional(u32) = .missing,
    total_kills: utils.Optional(u32) = .missing,
    current_period_kills: utils.Optional(u32) = .missing,
    total_assists: utils.Optional(u32) = .missing,
    current_period_assists: utils.Optional(u32) = .missing,
    total_deaths: utils.Optional(u32) = .missing,
    current_period_deaths: utils.Optional(u32) = .missing,
};

pub const DynamicField = union {}; // TODO: implement this

pub const Media = struct {
    url: []const u8,
};

const ApplicationIdentity = struct {
    provider_type: []const u8,
    provider_id: utils.Optional([]const u8) = .missing,
    provider_issued_user_id: []const u8,
};
