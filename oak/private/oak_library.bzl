load(":lib.bzl", "OakLibraryInfo", "gather_files")

def _oak_library(ctx):
    files = gather_files(ctx.files.srcs, ctx.attr.deps)

    return [
        DefaultInfo(files = files),
        OakLibraryInfo(deps = files),
    ]

oak_library = rule(
    _oak_library,
    attrs = {
        "srcs": attr.label_list(
            allow_files = [".oak"],
            mandatory = True,
        ),
        "data": attr.label_list(allow_files = True, default = []),
        "deps": attr.label_list(
            default = [],
            providers = [OakLibraryInfo],
        ),
    },
)
