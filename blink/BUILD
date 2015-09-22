load("/stm32f4/binary", "stm32f4_binary")
load("/tools/raw_binary", "raw_binary")

stm32f4_binary(
    name = "blink",
    srcs = [
        "main.c",
        "@libopencm3//:stm32f4",
    ],
)

raw_binary(
    name = "bin",
    src = ":blink",
)
