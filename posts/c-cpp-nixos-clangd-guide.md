# Getting clangd to work on NixOS

If you've tried using clangd on NixOS, you've probably hit `'vector' file not found` or `'iostream' file not found`. Here's how to actually fix them.

## Why it breaks

NixOS doesn't put headers in `/usr/include` the way other distros do. Everything lives in isolated Nix store paths, so clangd has no idea where the C++ standard library headers are. You have to tell it.

## Setup

### Files you need

Make a `flake.nix`:

```nix
{
  description = "C++ development environment with clangd";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            clang
            clang-tools  # includes clangd
            gcc  # for standard library headers
          ];

          shellHook = ''
            echo "C++ dev environment loaded"
            echo "clangd: $(clangd --version | head -n1)"
          '';
        };
      }
    );
}
```

Make a `.envrc`:

```bash
use flake
watch_file flake.nix
watch_file flake.lock
```

### Finding your include paths

Run `direnv allow`, then:

```bash
clang++ -E -x c++ - -v < /dev/null 2>&1 | grep -A 20 "search starts here"
```

This prints the exact include paths your compiler uses. You need all five:
- compiler-rt path (looks like `/nix/store/XXX-compiler-rt-libc-21.1.2-dev/include`)
- GCC C++ headers (`/nix/store/XXX-gcc-14.3.0/include/c++/14.3.0`)
- Platform-specific headers (`/nix/store/XXX-gcc-14.3.0/include/c++/14.3.0/x86_64-unknown-linux-gnu`)
- Clang resource path (`/nix/store/XXX-clang-wrapper-21.1.2/resource-root/include`)
- glibc headers (`/nix/store/XXX-glibc-2.40-66-dev/include`)

### Configure clangd

Make a `.clangd` file with your actual paths, in the same order the compiler lists them:

```yaml
CompileFlags:
  Add: 
    - -std=c++17
    - -isystem
    - /nix/store/YOUR-compiler-rt-libc-21.1.2-dev/include
    - -isystem
    - /nix/store/YOUR-gcc-14.3.0/include/c++/14.3.0
    - -isystem
    - /nix/store/YOUR-gcc-14.3.0/include/c++/14.3.0/x86_64-unknown-linux-gnu
    - -isystem
    - /nix/store/YOUR-clang-wrapper-21.1.2/resource-root/include
    - -isystem
    - /nix/store/YOUR-glibc-2.40-66-dev/include

Diagnostics:
  UnusedIncludes: Strict

InlayHints:
  Enabled: Yes
  ParameterNames: Yes
  DeducedTypes: Yes
```

Order matters: it has to match the compiler's.

### VS Code config

`.vscode/settings.json`:

```json
{
  "C_Cpp.intelliSenseEngine": "disabled",
  "clangd.path": "clangd",
  "clangd.arguments": [
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed"
  ]
}
```

This turns off IntelliSense from Microsoft's C++ extension so it doesn't fight with clangd.

### Steps

1. Install the clangd extension for VS Code
2. Run `direnv allow`
3. Get your nix store paths with that `clang++` command
4. Update `.clangd` with your paths
5. Open VS Code and restart the language server (Ctrl+Shift+P → "clangd: Restart language server")

## New projects

When you start a new C++ project:
- Copy the `flake.nix` and `.envrc`
- Run `direnv allow`
- Get fresh paths, since they change whenever packages update
- Make a new `.clangd` with the new paths

## When it still doesn't work

If you're getting header not found errors:
- The paths in `.clangd` are probably wrong or out of date
- Run the `clang++` command again to get fresh paths
- Make sure all five paths are there, in the right order
- Restart the language server

If clangd itself isn't found:
- Check you're in a directory with `.envrc`
- Run `direnv allow`
- `which clangd` should print a Nix store path

## Why this works

The whole problem is that clangd needs the same include paths `clang++` uses. On other distros everything's in `/usr/include`, so it just works. On NixOS you have to hand it all five paths explicitly, in order: compiler-rt, the C++ headers, the platform headers, clang's resource directory, and glibc.