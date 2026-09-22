const Snowflake = @import("../../snowflake.zig").Snowflake;

// question: TODO: support this
// answers: TODO: support this
expiry: ?[]const u8 = null,
allow_multiselect: bool,
// layout_type: TODO: support this
// results: TODO: support this

pub const PollCreateRequest = struct {
    // question: TODO: support this
    // answers: TODO: support this
    duration: ?u32 = null,
    allow_multiselect: ?bool = null,
    // layout_type: TODO: support this
};

pub const LayoutType = enum(u8) {
    default = 1,
};

pub const PollMedia = struct {
    text: ?[]const u8 = null,
    // emoji: TODO: support this
};

pub const PollAnswer = struct {
    answer_id: u32,
    // poll_media: TODO: support this
};

pub const PollResults = struct {
    is_finalized: bool,
    // answer_counts: TODO: support this
};

pub const PollAnswerCount = struct {
    id: u32,
    count: u32,
    me_voted: bool,
};
