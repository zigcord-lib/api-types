const PartialStruct = @import("zigcord-utils").PartialStruct;

const Snowflake = @import("../../snowflake.zig").Snowflake;
const Emoji = @import("../emoji/emoji.zig");

const Poll = @This();

question: PollMedia,
answers: []const PollAnswer,
expiry: ?[]const u8 = null,
allow_multiselect: bool,
layout_type: LayoutType,
results: PollResults,

pub const PollCreateRequest = struct {
    question: PollMedia,
    answers: []const PollAnswer,
    duration: ?u32 = null,
    allow_multiselect: ?bool = null,
    layout_type: ?LayoutType = null,
};

pub const LayoutType = enum(u8) {
    default = 1,
};

pub const PollMedia = struct {
    text: ?[]const u8 = null,
    emoji: ?PartialStruct(Emoji) = null,
};

pub const PollAnswer = struct {
    answer_id: u32,
    poll_media: PollMedia,
};

pub const PollResults = struct {
    is_finalized: bool,
    answer_counts: []const PollAnswerCount,
};

pub const PollAnswerCount = struct {
    id: u32,
    count: u32,
    me_voted: bool,
};
