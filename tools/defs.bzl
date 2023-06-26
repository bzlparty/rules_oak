"Tools"

load("@bazel_skylib//rules:write_file.bzl", "write_file")

def push_tag(name):
    write_file(
        name = name,
        out = "%s.sh" % name,
        content = [
            "#!/usr/bin/env bash",
            "cd $BUILD_WORKSPACE_DIRECTORY",
            """echo "Current tag: $(git tag -l | tail -1)" """,
            "read -p 'Enter tag: ' tag",
            "read -p 'Enter message: ' message",
            """git tag --annotate "$tag" --message "$message" && git push --all --tags""",
        ],
        is_executable = True,
    )
