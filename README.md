Standard Protobuf structs for Minecraft objects, used in a message bus with
EbonRoot.com (over ZMQ DEALER/ROUTER socket).

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
