Standard Protobuf structs for Minecraft objects, used in a message bus with
EbonRoot.com (over ZMQ DEALER/ROUTER socket).

<< WIP >>

# Structures

`Envelope` is an outer wrapper for all other types.  Everything should embed
from that point.

`Query` follows a GraphQL like approach (query or mutation).  Still in-design,
but we will need to determine how to scope this. It's not efficient to keep
the query string like in GraphQL, is there a way we can make the request in a
more focused manner.

# Java Usage

TBD

# Elixir Usage

1. install `protobuf` package for your app to get the `protoc` command.
2. install escript bits for mix, add escript to your path, and generate the models:

   ```bash
   mix escript.install hex protobuf
   export PATH=$PATH:~/.mix/escripts

   rm lib/protobuf/*
   protoc -I protobuf --elixir_out=lib/protobuf protobuf/*

   mix format
   ```

3. IMPORTANT: run `mix format` after regenerating new protobuf files, as the
   generated files do not follow format standard structure.
