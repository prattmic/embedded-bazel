cc_binary(
    name = "main",
    srcs = ["main.c"],
    deps = [
        "//mult",
        "//stm32f4:vector_table",
        "//stm32f4:link.ld",
    ],
    copts = [
        "-nostdlib",
        "-ffreestanding",
    ],
    linkopts = [
        "-static",
        "-nostdlib",
        "-T",
        "//stm32f4:link.ld",
    ],
    linkstatic = 1,
)
