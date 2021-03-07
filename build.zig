const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addSharedLibrary("zig", "src/main.zig", b.version(0,0,0));
    lib.addLibPath("/usr/lib/x86_64-linux-gnu/");
    lib.linkSystemLibrary("c");
    lib.linkSystemLibrary("tclstub8.6");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
