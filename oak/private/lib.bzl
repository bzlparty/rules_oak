OAK_TOOLCHAIN_TYPE = "@rules_oak//oak:toolchain_type"

OakLibraryInfo = provider(
    doc = "Oak library info",
    fields = {
        "deps": "depset of dependencies",
    },
)

def _get_toolchain_info(ctx):
  return ctx.toolchains[OAK_TOOLCHAIN_TYPE].oakinfo

def write_oak_launcher(ctx, name):
    oak = _get_toolchain_info(ctx)
    launcher = ctx.actions.declare_file(name)
    content = """
#!/bin/sh
{oak_bin} $@
""".format(oak_bin = oak.target_tool_path)

    ctx.actions.write(
        output = launcher,
        content = content,
        is_executable = True,
    )

    return launcher

def gather_files(srcs, deps):
    return depset(
        srcs,
        transitive = [dep[OakLibraryInfo].deps for dep in deps],
    )

def run_oak(ctx, args, outputs, inputs, cmd = "build"):
    oak = _get_toolchain_info(ctx)
    launcher = write_oak_launcher(ctx, "oak_%s_%s.sh" % (cmd, ctx.attr.name))
    arguments = ctx.actions.args()

    arguments.add(cmd)
    arguments.add_all(args)

    display = "%s%s" % (cmd[0].upper(), cmd[1:])

    message = display

    if cmd == "pack":
        message = "%s %s -> %s" % (display, ctx.file.entry_point.short_path, outputs[0].short_path)

    ctx.actions.run(
        outputs = outputs,
        inputs = inputs,
        use_default_shell_env = True,
        mnemonic = "Oak%s" % display,
        progress_message = message,
        arguments = [arguments],
        executable = launcher,
        tools = oak.tool_files,
    )
