Embedded Workspace for Bazel
============================

This workspace provides basic support for building for ARM Cortex-M4
with Bazel.

To build, you must specify `--cpu=cortex-m4`, as well as the host and target
`crosstool_top`. For example, to build the blink example for the STM32F4
Discovery board:

    $ bazel build --crosstool_top=//toolchain --host_crosstool_top=//tools/cpp:toolchain --cpu=cortex-m4 //blink:bin

Then you can flash the output to the board and watch it blink!

    $ st-flash write bazel-genfiles/blink/blink.bin 0x8000000
