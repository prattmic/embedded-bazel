def _impl(ctx):
    output = ctx.outputs.out
    input = ctx.file.src

    ctx.action(
        inputs=[input],
        outputs=[output],
        progress_message="Creating raw binary from %s" % input.short_path,
        command="arm-none-eabi-objcopy -O binary %s %s" % (input.path, output.path))

raw_binary = rule(
    implementation=_impl,
    attrs={"src": attr.label(mandatory=True, allow_files=True, single_file=True)},
    outputs={"out": "%{name}.bin"},
)
