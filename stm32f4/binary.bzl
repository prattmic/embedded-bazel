def stm32f4_binary(name, deps=[], copts=[], linkopts=[], **kwargs):
    """Create an STM32F4 cc_binary.

    Automatically uses an STM32F4 linker script and links against a vector
    table.
    """
    native.cc_binary(
        name = name,
        deps = deps + [
            "//stm32f4:vector_table",
            "//stm32f4:link.ld",
        ],
        copts = copts + [
            "-nostdlib",
            "-ffreestanding",
        ],
        linkopts = linkopts + [
            "-static",
            "-nostdlib",
            "-T",
            "//stm32f4:link.ld",
        ],
        linkstatic = 1,
        **kwargs
    )
