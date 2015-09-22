Embedded Workspace for Bazel
============================

This workspace provides basic support for building for ARM Cortex-M4
with Bazel.

For example, to build the blink example for the STM32F4 Discovery board:

    $ bazel build //blink:bin

Then you can flash the output to the board and watch it blink!

    $ st-flash write bazel-bin/blink/bin.bin 0x8000000
