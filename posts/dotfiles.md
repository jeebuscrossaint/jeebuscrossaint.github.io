# My dotfiles

My [dotfiles](https://github.com/jeebuscrossaint/dotfiles) are the config for the laptop I do everything on: Artix Linux (Arch without systemd, on runit), the [mango](https://github.com/DreamMaoMao/mangowc) Wayland compositor, kitty, fish and micro. Nearly 500 commits in, most of what's interesting isn't the config itself. It's the comments at the top of each file explaining which bug it exists to get around.

## No bar

There's no status bar. [conky](https://github.com/brndnmtthws/conky) draws everything a bar would show (tags, CPU, temperatures, memory, disk, fan, battery, volume, network, weather, uptime) straight onto the desktop layer, so it takes no screen space and never covers a window. Notifications come from dunst, fuzzel is the launcher, and that's every surface on the screen.

Getting conky to work on Wayland was the first fight. Its Wayland backend implements almost none of the X11 drawing calls, and when it hits one, like `${cpubar}` or `${cpugraph}`, it doesn't warn or skip it. It ends the render, and everything below that line disappears. So every bar and sparkline in the panel is built out of text characters in a small Lua file, and each block character was checked against the actual font file rather than assumed to exist.

## One theme, everywhere

Colors come from [coat](https://github.com/jeebuscrossaint/coat), a Rust tool I wrote that applies one Base16 or Base24 scheme to every app from a single config file. Twenty-one programs are enabled here, from the terminal and editor down to the PDF viewer, Discord, Minecraft's launcher and the compositor's own borders. `Super+Shift+T` picks a random scheme and applies it to all of them at once, and the compositor recolors without restarting.

That goal decided a lot of the rest. I retired two on-screen-display daemons, swayosd and wob, for the same reason: both read their styling once at startup, so changing the theme left the volume popup in the old colors until you restarted it. Now a 400-line shell script does volume, brightness, keyboard backlight, caps lock and media keys by sending a notification that replaces the last one, and dunst draws it in whatever the current theme is.

## Small scripts, each for a bug

Most of `~/.local/bin` exists because something failed quietly:

- **`osd`** can't hardcode the screen's backlight device. On this laptop, which GPU drives the panel depends on a BIOS setting, and only that GPU's driver registers a backlight. It's `intel_backlight` in one mode and `nvidia_0` in the other, and the wrong one isn't broken, it's just not there.
- **`battery-watch`** looks up the battery on every check instead of once at startup, because this machine sometimes boots with no battery device listed at all for a while. A watcher that looked once would have latched onto nothing.
- **`audio-ensure`** restarts the audio stack only when it's actually dead. The obvious test passes on a completely dead stack, because PipeWire invents a dummy output when there's no real one, so the script looks for that dummy instead.
- **`idle-guard`** locks the screen when I'm idle, but waits if audio is still playing.
- **`refresh-paru-completions`** works around a paru release that writes its package list compressed and reads it back as plain text, which made tab completion print binary garbage.

## The installer

`install.fish` links every file into `$HOME` one symlink at a time. It plans the whole run first and resolves conflicts before touching anything. You can back up, skip, or adopt a conflicting file into the repo and review the diff. Afterwards it plans again to prove every link actually landed. It also has a dry run, a dependency check, a flag for a Minecraft 1.8.9 PvP instance, and an uninstall that removes only the links it made.

```sh
git clone https://github.com/jeebuscrossaint/dotfiles ~/dotfiles
~/dotfiles/install.fish --dry-run
```
