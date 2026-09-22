const Snowflake = @import("../../snowflake.zig").Snowflake;
const User = @import("../user/user.zig");
const Guild = @import("../guild/guild.zig");

const GuildScheduledEvent = @This();

id: Snowflake,
guild_id: Snowflake,
channel_id: ?Snowflake = null,
creator_id: ?Snowflake = null,
name: []const u8,
description: ?[]const u8 = null,
scheduled_start_time: []const u8,
scheduled_end_time: ?[]const u8 = null,
privacy_level: GuildScheduledEventPrivacyLevel,
status: GuildScheduledEventStatus,
entity_type: GuildScheduledEventEntityType,
entity_id: ?Snowflake = null,
entity_metadata: ?GuildScheduledEventEntityMetadata = null,
creator: ?User = null,
user_count: ?u32 = null,
image: ?[]const u8 = null,
recurrence_rule: ?GuildScheduledEventRecurrenceRule = null,

pub const GuildScheduledEventPrivacyLevel = enum(u8) {
    guild_only = 2,
};

pub const GuildScheduledEventEntityType = enum(u8) {
    stage_instance = 1,
    voice = 2,
    external = 3,
};

pub const GuildScheduledEventStatus = enum(u8) {
    scheduled = 1,
    active = 2,
    completed = 3,
    canceled = 4,
};

pub const GuildScheduledEventEntityMetadata = struct {
    location: ?[]const u8 = null,
};

pub const GuildScheduledEventUser = struct {
    guild_scheduled_event_id: Snowflake,
    user: User,
    member: ?Guild.GuildMember = null,
};

pub const GuildScheduledEventRecurrenceRule = struct {
    start: []const u8,
    end: ?[]const u8 = null,
    // frequency: TODO: support this
    interval: u32,
    // by_weekday: TODO: support this
    // by_n_weekday: TODO: support this
    // by_month: TODO: support this
    by_month_day: ?[]u32 = null,
    by_year_day: ?[]u32 = null,
    count: ?u32 = null,
};

pub const GuildScheduledEventRecurrenceRuleFrequency = enum(u8) {
    yearly = 0,
    monthly = 1,
    weekly = 2,
    daily = 3,
};

pub const GuildScheduledEventRecurrenceRuleWeekday = enum(u8) {
    monday = 0,
    tuesday = 1,
    wednesday = 2,
    thursday = 3,
    friday = 4,
    saturday = 5,
    sunday = 6,
};

pub const GuildScheduledEventRecurrenceRuleN_Weekday = struct {
    n: u32,
    day: GuildScheduledEventRecurrenceRuleWeekday,
};

pub const GuildScheduledEventRecurrenceRuleMonth = enum(u8) {
    january = 1,
    february = 2,
    march = 3,
    april = 4,
    may = 5,
    june = 6,
    july = 7,
    august = 8,
    september = 9,
    october = 10,
    november = 11,
    december = 12,
};
