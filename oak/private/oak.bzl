"""Oak rule"""

load("@aspect_bazel_lib//lib:expand_make_vars.bzl", "expand_variables")

def _oak_impl(ctx):
    oak = ctx.toolchains["@rules_oak//oak:toolchain_type"].oakinfo
    args = ctx.actions.args()

    args.add(ctx.files.srcs[0].path)

    args.add_all([expand_variables(ctx, a, ctx.outputs.outputs) for a in ctx.attr.args])

    ctx.actions.run(
        outputs = ctx.outputs.outputs,
        inputs = depset(ctx.files.srcs),
        arguments = [args],
        env = ctx.var,
        executable = oak.target_tool_path,
        tools = oak.tool_files,
    )

oak = rule(
    implementation = _oak_impl,
    attrs = {
        "outputs": attr.output_list(
            mandatory = True,
            allow_empty = False,
        ),
        "args": attr.string_list(
            default = [],
        ),
        "srcs": attr.label_list(
            allow_files = [".oak"],
            mandatory = True,
        ),
        "deps": attr.label_list(allow_files = [".oak"]),
        "data": attr.label_list(allow_files = True),
    },
    toolchains = [
        "@rules_oak//oak:toolchain_type",
    ],
)
