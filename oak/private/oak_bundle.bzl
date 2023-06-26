"Oak bundle rule"

load(":lib.bzl", "OAK_TOOLCHAIN_TYPE", "OakLibraryInfo", "gather_files", "run_oak")

def _oak_bundle(ctx):
    entry_point = ctx.file.entry_point
    inputs = gather_files(srcs = ctx.files.srcs + [entry_point], deps = ctx.attr.deps)
    runfiles = ctx.runfiles(ctx.attr.data)
    bundle_ext = ".oak"
    args = []

    if ctx.attr.web:
        args.append("--web")
        bundle_ext = ".js"

    if ctx.outputs.out:
        bundle = ctx.outputs.out
    else:
        bundle = ctx.actions.declare_file(ctx.attr.name + bundle_ext)

    args.extend(["--output", bundle.path, "--entry", entry_point.short_path])
    outputs = [bundle]

    run_oak(
        ctx,
        cmd = "build",
        inputs = inputs,
        outputs = outputs,
        args = args,
    )

    return [
        OakLibraryInfo(deps = depset(outputs)),
        DefaultInfo(files = outputs, runfiles = runfiles),
    ]

oak_bundle = rule(
    implementation = _oak_bundle,
    attrs = {
        "web": attr.bool(
            default = False,
        ),
        "out": attr.output(),
        "entry_point": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
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
    toolchains = [OAK_TOOLCHAIN_TYPE],
)
