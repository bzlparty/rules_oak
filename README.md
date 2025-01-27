# Bazel rules for oak

[![CI](https://github.com/bzlparty/rules_oak/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/bzlparty/rules_oak/actions/workflows/ci.yaml)

## Installation

From the release you wish to use:
<https://github.com/bzlparty/rules_oak/releases>
copy the WORKSPACE snippet into your `WORKSPACE` file.

To use a commit rather than a release, you can point at any SHA of the repo.

For example to use commit `abc123`:

1. Replace `url = "https://github.com/bzlparty/rules_oak/releases/download/v0.1.0/rules_oak-v0.1.0.tar.gz"` with a GitHub-provided source archive like `url = "https://github.com/bzlparty/rules_oak/archive/abc123.tar.gz"`
1. Replace `strip_prefix = "rules_oak-0.1.0"` with `strip_prefix = "rules_oak-abc123"`
1. Update the `sha256`. The easiest way to do this is to comment out the line, then Bazel will
   print a message with the correct value. Note that GitHub source archives don't have a strong
   guarantee on the sha256 stability, see
   <https://github.blog/2023-02-21-update-on-the-future-stability-of-source-code-archives-and-hashes/>
