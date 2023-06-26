load(":lib.bzl", "OAK_TOOLCHAIN_TYPE", "OakLibraryInfo", "gather_files", "run_oak")

def _get_named_output_or_default(ctx, filepath):
    if ctx.outputs.output:
        return ctx.outputs.output

    return ctx.actions.declare_file(filepath)

def _get_artifact_args(entry, output):
    return ["--output", output.path, "--entry", entry.short_path]

def _gather_artifact_runfiles(ctx):
    return ctx.runfiles(files = ctx.attr.data)

def _oak_binary(ctx):
    entry = ctx.file.entry
    output = _get_named_output_or_default(ctx, ctx.attr.name)
    inputs = gather_files(srcs = ctx.files.srcs + [entry], deps = ctx.attr.deps)
    args = _get_artifact_args(entry, output)

    run_oak(
        ctx,
        cmd = "pack",
        inputs = inputs,
        outputs = [output],
        args = args,
    )

    return [
        DefaultInfo(
            executable = output,
            runfiles = _gather_artifact_runfiles(ctx),
        ),
    ]

oak_binary = rule(
    _oak_binary,
    attrs = {
        "entry": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "output": attr.output(),
        "srcs": attr.label_list(
            allow_files = [".oak"],
            mandatory = True,
        ),
        "deps": attr.label_list(
            default = [],
            providers = [OakLibraryInfo],
        ),
        "data": attr.label_list(allow_files = True),
    },
    executable = True,
    toolchains = [OAK_TOOLCHAIN_TYPE],
)
