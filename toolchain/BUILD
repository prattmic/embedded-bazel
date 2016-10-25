package(default_visibility = ["//visibility:public"])

filegroup(
    name = "empty",
    srcs = [],
)

cc_toolchain_suite(
    name = "toolchain",
    toolchains = {
        "cortex-m4|compiler": ":cc-compiler-cortex-m4",
    },
)

cc_toolchain(
    name = "cc-compiler-cortex-m4",
    all_files = ":empty",
    compiler_files = ":empty",
    cpu = "cortex-m4",
    dwp_files = ":empty",
    dynamic_runtime_libs = [":empty"],
    linker_files = ":empty",
    objcopy_files = ":empty",
    static_runtime_libs = [":empty"],
    strip_files = ":empty",
    supports_param_files = 0,
)
