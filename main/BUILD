cc_binary(
    name = "main",
    srcs = ["main.c"],
    deps = ["//mult"],
    copts = [
        "-nostdlib",
        "-ffreestanding",
    ],
    linkopts = [
        "-nostdlib",
        "-Ttext=0x8000000",
    ],
)
