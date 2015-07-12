/*
 * Copyright (C) 2013 F4OS Authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

/* Exception Handlers */
.syntax unified
.thumb

.arch armv7e-m

.section    .text, "ax"

.global _reset
.type _reset, %function
_reset:
    b       _start

.global hang
.type hang, %function
hang:
    b       .

/* Define weak default handlers which simply hang. */
.macro hang_exception name
    .global \name
    .weak \name
    .thumb_set \name, hang
.endm

hang_exception nmi_handler
hang_exception hardfault_handler
hang_exception memmanage_handler
hang_exception busfault_handler
hang_exception usagefault_handler
hang_exception svc_handler
hang_exception debug_handler
hang_exception pendsv_handler
hang_exception systick_handler
