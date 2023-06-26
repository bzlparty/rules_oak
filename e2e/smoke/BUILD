"""Provides a simple way to test your rules as an external workspace.
Add a basic smoke-test target below.
"""

load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@rules_oak//oak:defs.bzl", "oak", "oak_binary", "oak_library")

oak(
  name = "greeting",
  srcs = ["greeting.oak"],
  outputs = ["hello.txt"],
  args = ["$@"],
)

oak_binary(
  name = "say",
  srcs = ["say.oak"],
)

oak_library(
  name = "lib",
  srcs = ["lib.oak"],
)

oak_binary(
  name = "lib_say",
  srcs = ["lib_say.oak"],
  deps = [":lib"],
)

build_test(
    name = "smoke_test",
    targets = [
        # targets you add above
        ":greeting",
    ],
)
