load("//stm32f4:binary.bzl", "stm32f4_binary")
load("//tools:raw_binary.bzl", "raw_binary")

stm32f4_binary(
    name = "blink",
    srcs = ["main.c"],
)

raw_binary(
    name = "bin",
    src = ":blink",
)
