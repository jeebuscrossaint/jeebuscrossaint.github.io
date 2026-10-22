# My homelab

A used ThinkPad running everything I'd otherwise pay for or put up with ads for. Everything lives in [one repo](https://github.com/jeebuscrossaint/homelab).

## The machine

A ThinkPad X1 Carbon Gen 7 I bought used for about $100: an i5-8365U, 8 GB of RAM, and a 1 TB SSD. It runs Arch with no desktop. It boots to a text login, ignores the lid, never sleeps, and stops charging at 80% so the battery survives being plugged in all the time.

It sits on campus wifi. Nothing is port-forwarded, and nothing is reachable from the internet unless I say so. The campus wifi can't reach the apps either: they only listen on the server's Tailscale address.

## How I reach it

<figure><img src="posts/assets/homelab.svg" width=720 height=550 loading=lazy decoding=async alt="How my devices, the internet and the campus wifi each reach the ThinkPad"></figure>

- **[Tailscale](https://tailscale.com)** puts the server and my devices on one private network, from anywhere.
- **[CoreDNS](https://coredns.io)** answers `*.lab` with the server's Tailscale address, and **Tailscale split DNS** sends only `.lab` lookups to it.
- **[Caddy](https://caddyserver.com)** sends `pdf.lab` to the PDF app, `latex.lab` to Overleaf, and so on, with HTTPS from its own CA; each device trusts the root once.
- **[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh)** gives me `ssh server` with my Tailscale login; the server's own SSH takes keys only.

So every app gets a short name like `https://pdf.lab`, with a lock icon, from any of my devices, and from nobody else's. None of them asks me to log in, either (more on that below).

## What runs on it

- `home.lab` [Homepage](https://gethomepage.dev), instead of a bookmarks folder
- `pdf.lab` [Stirling PDF](https://www.stirlingpdf.com), instead of ilovepdf and friends
- `convert.lab` [Transmute](https://transmute.sh), instead of sketchy file-converter sites
- `search.lab` [SearXNG](https://docs.searxng.org), instead of Google
- `latex.lab` [Overleaf](https://github.com/overleaf/overleaf), instead of Overleaf's compile timeout
- `draw.lab` [ExcaliDash](https://github.com/ZimengXiong/ExcaliDash), instead of Excalidraw forgetting my drawings
- `keep.lab` [Karakeep](https://karakeep.app), instead of bookmarks across three browsers
- `share.lab` [Pingvin Share X](https://github.com/smp46/pingvin-share-x), instead of temp.sh and WeTransfer
- `changes.lab` [changedetection.io](https://changedetection.io), instead of refreshing a page by hand
- `tools.lab` [IT-Tools](https://it-tools.tech), instead of a dozen single-purpose websites
- `term.lab` [ttyd](https://github.com/tsl0922/ttyd), instead of needing a laptop with SSH on it
- `top.lab` [Glances](https://nicolargo.github.io/glances/), instead of btop
- `stats.lab` [Beszel](https://beszel.dev), instead of wondering if the server is on fire
- `logs.lab` [Dozzle](https://dozzle.dev), instead of `docker logs`
- `dockge.lab` [Dockge](https://dockge.kuma.pet), instead of `docker compose` by hand

Beszel posts to a Discord channel when the server goes down, runs hot, or fills up. A [Tor Snowflake proxy](https://snowflake.torproject.org) runs in the background and helps people in censored countries reach Tor; the dashboard counts how many. An [I2P](https://i2pd.website) router relays traffic for the I2P network the same way.

Pingvin Share is the one app with a public side. [Tailscale Funnel](https://tailscale.com/kb/1223/funnel) forwards it to the internet, so a share link works for anyone, while uploading stays on my network. The public address skips Caddy, so outsiders get Pingvin's normal login page, and there's no account for them to make.

## Setting up a new one

```sh
git clone https://github.com/jeebuscrossaint/homelab
cd homelab
sudo ./install.sh
```

On a fresh Arch or Alpine install, this installs Docker and Tailscale, joins the tailnet, writes the settings and every secret, applies the server tweaks, and starts every app. Run it again any time; it only does what's missing.

## Things that took me too long

- **Tailscale Funnel on port 443 breaks everything else.** Funnel claims 443 on the machine's Tailscale address, which is where Caddy serves every `.lab` site. `tailscale funnel --bg --https=8443 <port>` puts it on 8443 instead.
- **Campus wifi drops Docker Hub.** The login server for Docker Hub timed out about half the time; GitHub's registry never did. The install script retries every download eight times.
- **Don't restart Docker from a terminal that runs in Docker.** The web terminal is a container, so restarting Docker killed the shell running the install script halfway through. The script now ignores hangups, and Docker's `live-restore` keeps containers up through a restart.
- **Docker keeps every log forever by default.** `"log-opts": {"max-size": "10m", "max-file": "3"}` in `/etc/docker/daemon.json` caps it.
- **Most apps want an admin account even when only you can reach them.** None of mine ask any more. The install script makes one user per app with a random password, then either the app logs me in by itself (Beszel's `AUTO_LOGIN`, Dockge's "disable auth" setting) or Caddy does it. For Overleaf, Pingvin and Transmute, Caddy swaps the login page for a tiny page that posts the password and reloads. That's only OK because nobody else can reach those pages.
- **Docker publishes ports on every network, not just the one you meant.** `ports: - 443:443` listened on the campus wifi too, so anyone there could have reached the passwordless web terminal. Write the address in: `${TAILSCALE_IP}:443:443`. Then set `net.ipv4.ip_nonlocal_bind=1`, or Caddy fails to start at boot when Docker comes up before Tailscale has its address.
- **An app that runs a setup page on first visit is open until you visit it.** Zipline, Dockge and Transmute all sat unclaimed, Zipline on a public Funnel address. Whoever opened it first would have been the admin. Have the install script make the account.
- **Reloading Caddy after a `git pull` reloads the old Caddyfile.** A single-file bind mount keeps pointing at the old file once git replaces it. Restart the container instead.
- **Rebooting through the firmware is slow.** `kexec` boots the new kernel straight from the running one. Arch's mkinitcpio can pack the initramfs into one kernel image, though, and kexec can't load that, so my `kexec-reboot` script pulls it back out with `objcopy --only-section=.initrd`.
