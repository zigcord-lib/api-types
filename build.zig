const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    _ = optimize;

    const zigcord_utils_dep = b.dependency("zigcord_utils", .{});

    const mod = b.addModule("api_types", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .imports = &.{
            .{
                .name = "zigcord-utils",
                .module = zigcord_utils_dep.module("zigcord-utils"),
            },
        },
    });

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });

    const run_mod_tests = b.addRunArtifact(mod_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
}
