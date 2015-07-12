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

.global nmi_handler
.weak nmi_handler
.type nmi_handler, %function
nmi_handler:
    b       hang

.global hardfault_handler
.weak hardfault_handler
.type hardfault_handler, %function
hardfault_handler:
    b       hang

.global memmanage_handler
.weak memmanage_handler
.type memmanage_handler, %function
memmanage_handler:
    b       hang

.global busfault_handler
.weak busfault_handler
.type busfault_handler, %function
busfault_handler:
    b       hang

.global usagefault_handler
.weak usagefault_handler
.type usagefault_handler, %function
usagefault_handler:
    b       hang

.global svc_handler
.weak svc_handler
.type svc_handler, %function
svc_handler:
    b       hang

.global debug_handler
.weak debug_handler
.type debug_handler, %function
debug_handler:
    b       hang

.global pendsv_handler
.weak pendsv_handler
.type pendsv_handler, %function
pendsv_handler:
    b       hang

.global systick_handler
.weak systick_handler
.type systick_handler, %function
systick_handler:
    b       hang
