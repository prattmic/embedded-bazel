cc_binary(
    name = "blink",
    srcs = ["main.c"],
    deps = [
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

genrule(
    name = "bin",
    outs = ["blink.bin"],
    srcs = [":blink"],
    cmd = "arm-none-eabi-objcopy -O binary $< $@",
)
