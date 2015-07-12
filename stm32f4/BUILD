package(default_visibility = ["//visibility:public"])

cc_library(
    name = "vector_table",
    srcs = ["vector.S"],
    deps = ["//armv7m:default_exception_handlers"],
    alwayslink = 1,
)

exports_files(["link.ld"])
