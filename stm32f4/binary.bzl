def stm32f4_binary(name, deps=[], linkopts=[], **kwargs):
    """Create an STM32F4 cc_binary.

    Automatically uses an STM32F4 linker script and links against a vector
    table.
    """
    native.cc_binary(
        name = name,
        deps = deps + [
            "//bsp",
            "//stm32f4:vector_table",
            "//stm32f4:link.ld",
        ],
        linkopts = linkopts + [
            "-static",
            "-T",
            "//stm32f4:link.ld",
        ],
        linkstatic = 1,
        **kwargs
    )
