MEMORY {
    flash (rx)   : ORIGIN = 0x08000000, LENGTH = 0x100000
    ccmram (rwx) : ORIGIN = 0x10000000, LENGTH = 0x10000
    ram (rwx)    : ORIGIN = 0x20000000, LENGTH = 0x1c000
    ethram (rwx) : ORIGIN = 0x2001c000, LENGTH = 0x4000
}

/* Top of ccmram */
_initial_sp = 0x1000fff0;

SECTIONS {
    .vector :
    {
        . = ALIGN(8);
        KEEP(*(.vector))
        . = ALIGN(8);
    } > "flash"
    AT> "flash"

    .text :
    {
        . = ALIGN(8);
        *(.text*)
        . = ALIGN(8);
    } > "flash"
    AT> "flash"

    .rodata :
    {
        . = ALIGN(8);
        *(.rodata*)
        . = ALIGN(8);
    } > "flash"
    AT> "flash"

    .ARM.extab :
    {
      *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > "flash"
    AT> "flash"

    __exidx_start = .;
    .ARM.exidx :
    {
      *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > "flash"
    AT> "flash"
    __exidx_end = .;

    .data :
    {
        . = ALIGN(8);
        _data_start = .;
        *(.data*)
        _data_end = .;
        . = ALIGN(8);
    } > "ccmram"
    AT> "flash"

    _sidata = LOADADDR(.data);

    .bss :
    {
        . = ALIGN(8);
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
        . = ALIGN(8);
    } > "ccmram"
    AT> "flash"

    .heap :
    {
        . = ALIGN(8);
        _end = .;
    } > "ram"
    AT> "flash"
}
