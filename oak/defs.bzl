"Public API re-exports"

load("//oak/private:oak_binary.bzl", _oak_binary = "oak_binary")
load("//oak/private:oak_bundle.bzl", _oak_bundle = "oak_bundle")
load("//oak/private:oak_library.bzl", _oak_library = "oak_library")
load("//oak/private:oak.bzl", _oak = "oak")

oak_bundle = _oak_bundle
oak_library = _oak_library
oak = _oak

def oak_binary(name, srcs, entry = None, **kwargs):
  if not entry and len(srcs) > 0:
    entry = srcs[0]

  _oak_binary(
    name = name,
    entry = entry,
    srcs = srcs,
    **kwargs
  )
