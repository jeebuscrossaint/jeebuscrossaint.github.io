# Getting clangd to work on NixOS

If you've tried using clangd on NixOS, you've probably hit `'vector' file not found` or `'iostream' file not found`. NixOS doesn't put headers in `/usr/include` the way other distros do. Everything lives in isolated Nix store paths, so clangd has no idea where the C++ standard library headers are. On other distros it just works; here you have to hand clangd the same five include paths `clang++` uses, in the same order.

## 1. A dev shell

A `flake.nix` that brings in clang, clangd (from `clang-tools`) and gcc, for the standard library headers:

```nix
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ clang clang-tools gcc ];
        };
      });
}
```

And a `.envrc`, so direnv loads it whenever you `cd` in. Run `direnv allow` once.

```bash
use flake
watch_file flake.nix
watch_file flake.lock
```

## 2. Find your include paths

Ask the compiler where it looks:

```bash
clang++ -E -x c++ - -v < /dev/null 2>&1 | grep -A 20 "search starts here"
```

It prints five paths: compiler-rt, the GCC C++ headers, the platform-specific headers, clang's resource directory, and glibc.

## 3. Tell clangd

Put them in a `.clangd`, in the order the compiler printed them. Order matters.

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

## 4. VS Code

Install the clangd extension, and turn off IntelliSense from Microsoft's C++ extension in `.vscode/settings.json` so the two don't fight. Then restart the language server (Ctrl+Shift+P → "clangd: Restart language server").

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

## When it breaks again

The store paths change whenever packages update. For a new project, copy the `flake.nix` and `.envrc` over, run step 2 again, and write a fresh `.clangd`. If headers go missing later, the paths are out of date: rerun step 2, check all five are there in the right order, and restart the language server. If clangd itself isn't found, you're outside the dev shell: run `direnv allow`, and `which clangd` should print a Nix store path.
