const Builder = @import("std").build.Builder;
const Version = @import("std").builtin.Version;

pub fn build(b: *Builder) void {
    
    const version =  Version {
       .major = 0,
       .minor = 0,
       .patch = 1,
    };
    const mode = b.standardReleaseOptions();
    const lib = b.addSharedLibrary("test", "src/main.zig", b.version(version.major,version.minor,version.patch));
    lib.linkSystemLibrary("c");
    lib.linkSystemLibraryName("tclstub8.6");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
