load("/stm32f4/binary", "stm32f4_binary")

stm32f4_binary(
    name = "blink",
    srcs = ["main.c"],
)

genrule(
    name = "bin",
    outs = ["blink.bin"],
    srcs = [":blink"],
    cmd = "arm-none-eabi-objcopy -O binary $< $@",
)
