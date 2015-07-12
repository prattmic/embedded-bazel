package(default_visibility = ["//visibility:public"])

cc_library(
    name = "crt0",
    srcs = ["crt0.c"],
    # This code must *not* use the GOT. The GOT is stored in the .data section,
    # which crt0 is initializing.
    nocopts = "-fPIC",
    alwayslink = 1,
)
