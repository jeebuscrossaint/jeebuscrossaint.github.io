#!/usr/bin/env python3
"""Regenerate schemes.js from a local checkout of tinted-theming/schemes.

Produces the compact runtime format consumed by theme.js / index.html:
    window.__SCHEMES=[["Name","d","<96 hex chars>"], ...];
where the 96-char string is base00..base0F concatenated (no '#'), and the
variant char is 'd' (dark) or 'l' (light). Base24's extra colors are dropped
so the payload stays identical to the base16 shape the site already uses.
"""
import glob
import json
import os
import sys

import yaml

SRC = os.environ.get("TT_DIR", "tt-schemes")
OUT = os.environ.get("OUT_FILE", "schemes.js")
KEYS = ["base%02X" % i for i in range(16)]  # base00 .. base0F


def load(path):
    with open(path, encoding="utf-8") as f:
        data = yaml.safe_load(f)
    pal = data.get("palette") or {}
    try:
        hexstr = "".join(pal[k].lstrip("#").lower() for k in KEYS)
    except (KeyError, AttributeError):
        return None
    if len(hexstr) != 96 or any(c not in "0123456789abcdef" for c in hexstr):
        return None
    name = str(data.get("name") or os.path.splitext(os.path.basename(path))[0])
    variant = "l" if str(data.get("variant", "dark")).lower().startswith("l") else "d"
    return [name, variant, hexstr]


def main():
    paths = []
    for system in ("base16", "base24"):
        for ext in ("yaml", "yml"):
            paths += glob.glob(os.path.join(SRC, system, "*." + ext))
    if not paths:
        sys.exit("no scheme files found under %r — is the repo checked out?" % SRC)

    schemes, seen = [], set()
    for p in sorted(paths):
        s = load(p)
        if not s:
            continue
        key = s[0].lower()
        if key in seen:  # base24 may re-declare a base16 name; keep first
            continue
        seen.add(key)
        schemes.append(s)

    schemes.sort(key=lambda s: s[0].lower())  # stable order -> clean diffs
    body = json.dumps(schemes, separators=(",", ":"), ensure_ascii=False)
    with open(OUT, "w", encoding="utf-8", newline="\n") as f:
        f.write("window.__SCHEMES=" + body + ";\n")

    darks = sum(1 for s in schemes if s[1] == "d")
    print("wrote %d schemes (%d dark, %d light) -> %s" % (len(schemes), darks, len(schemes) - darks, OUT))


if __name__ == "__main__":
    main()
