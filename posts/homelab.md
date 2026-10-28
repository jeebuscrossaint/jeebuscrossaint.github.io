# My homelab

A used ThinkPad running everything I'd otherwise pay for or put up with ads for. Everything lives in [one repo](https://github.com/jeebuscrossaint/homelab).

## The machine

A ThinkPad X1 Carbon Gen 7 I bought used for about $100: an i5-8365U, 8 GB of RAM, and a 1 TB SSD. It runs Arch with no desktop. It boots to a text login, ignores the lid, never sleeps, turns the screen off when idle, and swaps to compressed RAM (zram) before it touches the SSD.

It sits on campus wifi. Nothing is port-forwarded, and nothing is reachable from the internet unless I say so. The campus wifi can't reach the apps either: they only listen on the server's Tailscale address.

## How I reach it

<figure><img src="posts/assets/homelab.svg" width=720 height=550 loading=lazy decoding=async alt="How my devices, the internet and the campus wifi each reach the ThinkPad"></figure>

- **[Tailscale](https://tailscale.com)** puts the server and my devices on one private network, from anywhere.
- **[CoreDNS](https://coredns.io)** answers `*.lab` with the server's Tailscale address, and **Tailscale split DNS** sends only `.lab` lookups to it.
- **[Caddy](https://caddyserver.com)** sends `pdf.lab` to the PDF app, `latex.lab` to Overleaf, and so on, with HTTPS from its own CA; each device trusts the root once.
- **[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh)** gives me `ssh server` with my Tailscale login; the server's own SSH takes keys only.

So every app gets a short name like `https://pdf.lab`, with a lock icon, from any of my devices, and from nobody else's. None of them asks me to log in, either (more on that below).

## What runs on it

- `home.lab` [Glance](https://github.com/glanceapp/glance), instead of a bookmarks folder
- `pdf.lab` [BentoPDF](https://github.com/alam00000/bentopdf), instead of ilovepdf and friends
- `convert.lab` [Transmute](https://transmute.sh), instead of sketchy file-converter sites
- `latex.lab` [Overleaf](https://github.com/overleaf/overleaf), instead of Overleaf's compile timeout
- `draw.lab` [ExcaliDash](https://github.com/ZimengXiong/ExcaliDash), instead of Excalidraw forgetting my drawings
- `keep.lab` [Readeck](https://readeck.org), instead of bookmarks across three browsers
- `share.lab` [Gokapi](https://github.com/Forceu/Gokapi), instead of temp.sh and WeTransfer
- `term.lab` [Nexterm](https://github.com/gnmyt/Nexterm), instead of needing a laptop with SSH on it
- `stats.lab` [Beszel](https://beszel.dev), instead of wondering if the server is on fire

It used to run more: search, page-change alerts, a log viewer, a Docker manager and a few single-purpose tool sites. I've cut them since.

Beszel posts to a Discord channel when the server goes down, runs hot, or fills up. BentoPDF does all its work in the browser, so the server only hands out the page. Nexterm gives the terminal tabs, split panes and a file browser, and logs into the server over SSH with its own key, which only works from Docker's network.

Gokapi is the one app with a public side. [Tailscale Funnel](https://tailscale.com/kb/1223/funnel) forwards a second Caddy port to the internet, so a share link works for anyone. That port only passes downloads: the admin and upload pages answer 404, and it strips the header that would sign someone in. Uploading stays on my network.

## Helping strangers

Two things run in the background with no page of their own, and lend my bandwidth to other people:

- A **[Tor Snowflake proxy](https://snowflake.torproject.org)**. Someone in a country that blocks Tor connects to it from their browser, and it passes their already-encrypted traffic on to a Tor bridge. It isn't a relay or an exit, and it can't see what they're doing.
- An **[i2pd](https://i2pd.website) router**. It carries other people's encrypted tunnels through the I2P network as a middle hop, never an exit.

The dashboard has a tile for each. Both would do more on an open connection: campus wifi is a symmetric NAT, so nobody can connect in, and I only carry traffic over connections I started.

## Setting up a new one

```sh
git clone https://github.com/jeebuscrossaint/homelab
cd homelab
sudo ./install.sh
```

On a fresh Arch or Alpine install, this installs Docker and Tailscale, joins the tailnet, writes the settings and every secret, applies the server tweaks, starts every app, and makes each app's one user. Run it again any time; it only does what's missing. `--pull` also updates the apps.

## Things that took me too long

- **Tailscale Funnel on port 443 breaks everything else.** Funnel claims 443 on the machine's Tailscale address, which is where Caddy serves every `.lab` site. `tailscale funnel --bg --https=8443 <port>` puts it on 8443 instead.
- **Campus wifi drops Docker Hub.** The login server for Docker Hub timed out about half the time; GitHub's registry never did. The install script retries every download eight times.
- **Don't restart Docker from a terminal that runs in Docker.** The web terminal is a container, so restarting Docker killed the shell running the install script halfway through. The script now ignores hangups, and Docker's `live-restore` keeps containers up through a restart.
- **Docker keeps every log forever by default.** `"log-opts": {"max-size": "10m", "max-file": "3"}` in `/etc/docker/daemon.json` caps it.
- **Most apps want an admin account even when only you can reach them.** None of mine ask any more. The install script makes one user per app with a random password, then something signs me in: Beszel by itself (`AUTO_LOGIN`), Gokapi by trusting a header Caddy sets, and the rest through Caddy. For Overleaf, Readeck, Transmute and Nexterm, Caddy swaps the login page for a tiny page that posts the password and reloads. That's only OK because nobody else can reach those pages.
- **Docker publishes ports on every network, not just the one you meant.** `ports: - 443:443` listened on the campus wifi too, so anyone there could have reached the passwordless web terminal. Write the address in: `${TAILSCALE_IP}:443:443`. Then set `net.ipv4.ip_nonlocal_bind=1`, or Caddy fails to start at boot when Docker comes up before Tailscale has its address.
- **An app that runs a setup page on first visit is open until you visit it.** Zipline, Dockge and Transmute all sat unclaimed at one point, Zipline on a public Funnel address. Whoever opened it first would have been the admin. Now the install script fills in every setup page itself.
- **Reloading Caddy after a `git pull` reloads the old Caddyfile.** A single-file bind mount keeps pointing at the old file once git replaces it. Restart the container instead.
- **Snowflake's traffic counters aren't in bytes.** The metric is called `traffic_inbound_bytes_total`, but the proxy adds kilobytes to it, so my dashboard showed a thousandth of the real traffic. The help text says "(KB)"; the name doesn't.
- **Rebooting through the firmware is slow.** `kexec` boots the new kernel straight from the running one. Arch's mkinitcpio can pack the initramfs into one kernel image, though, and kexec can't load that, so my `kexec-reboot` script pulls it back out with `objcopy --only-section=.initrd`.
