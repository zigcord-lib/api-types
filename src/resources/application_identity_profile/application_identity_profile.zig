username: ?[]const u8 = null,
// metadata: TODO: support this
data: ?ProfileData = null,

pub const ProfileData = struct {
    primary: ?PrimaryProfileData = null,
    dynamic: ?[]DynamicField = null,
};

pub const PrimaryProfileData = struct {
    season: ?[]const u8 = null,
    rank_name: ?[]const u8 = null,
    rank_image: ?Media = null,
    highest_rank: ?[]const u8 = null,
    highest_rank_image: ?Media = null,
    featured_played_character: ?[]const u8 = null,
    featured_played_character_image: ?Media = null,
    playtime_hours: ?f64 = null,
    total_wins: ?u32 = null,
    current_period_wins: ?u32 = null,
    total_games: ?u32 = null,
    current_period_games: ?u32 = null,
    total_kills: ?u32 = null,
    current_period_kills: ?u32 = null,
    total_assists: ?u32 = null,
    current_period_assists: ?u32 = null,
    total_deaths: ?u32 = null,
    current_period_deaths: ?u32 = null,
};

pub const DynamicField = union {}; // TODO: implement this

pub const Media = struct {
    url: []const u8,
};

const ApplicationIdentity = struct {
    provider_type: []const u8,
    provider_id: ?[]const u8 = null,
    provider_issued_user_id: []const u8,
};
