# My homelab

A used ThinkPad running everything I'd otherwise pay for or put up with ads for. Everything lives in [one repo](https://github.com/jeebuscrossaint/homelab).

## The machine

A ThinkPad X1 Carbon Gen 7 I bought used for about $100: an i5-8365U, 8 GB of RAM, and a 1 TB SSD. It runs Arch with no desktop. It boots to a text login, ignores the lid, never sleeps, and stops charging at 80% so the battery survives being plugged in all the time.

It sits on campus wifi. Nothing is port-forwarded, and nothing is reachable from the internet unless I say so.

## How I reach it

| Piece | Job |
|---|---|
| [Tailscale](https://tailscale.com) | Puts the server and my devices on one private network, from anywhere |
| [CoreDNS](https://coredns.io) | Answers `*.lab` with the server's Tailscale address |
| Tailscale split DNS | Sends only `.lab` lookups to that CoreDNS |
| [Caddy](https://caddyserver.com) | Sends `pdf.lab` to the PDF app, `latex.lab` to Overleaf, and so on |
| Caddy's own CA | HTTPS for every `.lab` name; each device trusts the root once |

So every app gets a short name like `https://pdf.lab`, with a lock icon, from any of my devices, and from nobody else's.

## What runs on it

| Address | App | Replaces |
|---|---|---|
| `home.lab` | [Homepage](https://gethomepage.dev) | a bookmarks folder |
| `pdf.lab` | [Stirling PDF](https://www.stirlingpdf.com) | ilovepdf and friends |
| `convert.lab` | [Transmute](https://transmute.sh) | sketchy file-converter sites |
| `search.lab` | [SearXNG](https://docs.searxng.org) | Google |
| `latex.lab` | [Overleaf](https://github.com/overleaf/overleaf) | Overleaf's compile timeout |
| `draw.lab` | [ExcaliDash](https://github.com/ZimengXiong/ExcaliDash) | Excalidraw forgetting my drawings |
| `keep.lab` | [Karakeep](https://karakeep.app) | bookmarks across three browsers |
| `share.lab` | [Zipline](https://github.com/diced/zipline) | temp.sh |
| `changes.lab` | [changedetection.io](https://changedetection.io) | refreshing a page by hand |
| `term.lab` | [ttyd](https://github.com/tsl0922/ttyd) | needing a laptop with SSH on it |
| `top.lab` | [Glances](https://nicolargo.github.io/glances/) | btop |
| `stats.lab` | [Beszel](https://beszel.dev) | wondering if the server is on fire |
| `logs.lab` | [Dozzle](https://dozzle.dev) | `docker logs` |
| `dockge.lab` | [Dockge](https://dockge.kuma.pet) | `docker compose` by hand |

Beszel posts to a Discord channel when the server goes down, runs hot, or fills up. A [Tor Snowflake proxy](https://snowflake.torproject.org) runs in the background and helps people in censored countries reach Tor; the dashboard counts how many.

Zipline is the one app with a public side. [Tailscale Funnel](https://tailscale.com/kb/1223/funnel) forwards it to the internet, so a share link works for anyone, while uploading stays on my network.

## Setting up a new one

```sh
git clone https://github.com/jeebuscrossaint/homelab
cd homelab
sudo ./install.sh
```

On a fresh Arch or Alpine install, this installs Docker and Tailscale, joins the tailnet, writes the settings and every secret, applies the server tweaks, and starts every app. Run it again any time; it only does what's missing.

## Things that took me too long

- **Tailscale Funnel on port 443 breaks everything else.** Funnel claims 443 on the machine's Tailscale address, which is where Caddy serves every `.lab` site. Put Funnel on 8443 instead: `tailscale funnel --bg --https=8443 <port>`.
- **Campus wifi drops Docker Hub.** The login server for Docker Hub timed out about half the time; GitHub's registry never did. The install script retries every download eight times.
- **Don't restart Docker from a terminal that runs in Docker.** The web terminal is a container, so restarting Docker killed the shell running the install script halfway through. The script now ignores hangups, and Docker's `live-restore` keeps containers up through a restart.
- **Docker keeps every log forever by default.** Cap it in `/etc/docker/daemon.json` with `"log-opts": {"max-size": "10m", "max-file": "3"}`.
- **Most apps want an admin account even when only you can reach them.** Several can skip it: Beszel creates its user and logs you in automatically with `USER_EMAIL`, `USER_PASSWORD` and `AUTO_LOGIN`, and ExcaliDash has a "Keep Disabled" button. Overleaf and Dockge can't.
