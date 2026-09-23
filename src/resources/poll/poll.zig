const utils = @import("zigcord-utils");

const Snowflake = @import("../../snowflake/snowflake.zig").Snowflake;
const Emoji = @import("../emoji/emoji.zig");

const Poll = @This();

question: PollMedia,
answers: []const PollAnswer,
expiry: ?[]const u8 = null,
allow_multiselect: bool,
layout_type: LayoutType,
results: utils.Optional(PollResults) = .missing,

pub const PollCreateRequest = struct {
    question: PollMedia,
    answers: []const PollAnswer,
    duration: utils.Optional(u32) = .missing,
    allow_multiselect: utils.Optional(bool) = .missing,
    layout_type: utils.Optional(LayoutType) = .missing,
};

pub const LayoutType = enum(u8) {
    default = 1,
};

pub const PollMedia = struct {
    text: utils.Optional([]const u8) = .missing,
    emoji: utils.Optional(utils.PartialStruct(Emoji)) = .missing,
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
