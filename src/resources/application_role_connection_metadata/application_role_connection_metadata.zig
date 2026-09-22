type: ApplicationRoleConnectionMetadataType,
key: []const u8,
name: []const u8,
// name_localizations: TODO: support this
description: []const u8,
// description_localizations: TODO: support this

pub const ApplicationRoleConnectionMetadataType = enum(u8) {
    integer_less_than_or_equal = 1,
    integer_greater_than_or_equal = 2,
    integer_equal = 3,
    integer_not_equal = 4,
    datetime_less_than_or_equal = 5,
    datetime_greater_than_or_equal = 6,
    boolean_equal = 7,
    boolean_not_equal = 8,
};
