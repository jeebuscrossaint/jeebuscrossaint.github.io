# apatel.co

Personal site for Amarnath Patel. Static HTML, no framework, no build step for the pages
themselves, **no JavaScript at all**, no third-party requests at runtime.

## Layout

    index.html        home — the card: who, work, writing, links
      stardust.html     asteroid precovery (Knight Hacks IX)
      holography.html   photonic lantern characterisation (CREOL)
      celeris.html      RCWA solver / metalens design
      polyoculus.html   telescope array instrumentation
      chameleon.html    AI-detector evaluation
      aev.html          solar car telemetry software
    writing.html      writing index
      writing-<slug>.html  one pre-rendered page per post
    friends.html      links
    404.html

    s.css             the whole stylesheet
    fonts/            IBM Plex Sans + Mono, Latin subset
    assets/           camera originals plus everything build-images.sh derives
    posts/            markdown SOURCES — see "Adding a post"
    feed.xml          Atom feed for the writing

Résumé and CV are plain links to `resume.pdf` / `cv.pdf`; browsers render PDFs natively,
so the site ships no viewer. The targeted résumé variants (`resume-*.pdf`) are unlinked
and `robots.txt`-disallowed, which keeps them out of search results — it does **not**
make them private. Anything in a public Pages repo is fetchable by anyone with the URL.

## Adding a post

`posts/<slug>.md` is the source of truth. The site serves pre-rendered HTML, so after
editing the markdown you must regenerate the page — the `.md` is not read at runtime:

    pandoc -f gfm posts/<slug>.md -o /tmp/body.html

Paste the body into `writing-<slug>.html` (copy an existing one for the surrounding
chrome), then add the post to `writing.html`, to the list on `index.html`, to
`sitemap.xml`, and to `feed.xml`.

## Regenerating images

Originals live in `assets/`; everything the pages load is derived from them.

    sh scripts/build-images.sh   # photos, figures, per-page social cards
    sh scripts/build-og.sh       # site-wide social card, from scripts/og.html

Both need ImageMagick (`magick`); `build-og.sh` also needs Chrome or Chromium.

## Regenerating the fonts

IBM Plex Sans (400, 400 italic, 600, 600 italic) and Plex Mono 400, the Latin-subset
woff2 files from `@fontsource/ibm-plex-sans` / `@fontsource/ibm-plex-mono` 5.1.0:

    https://cdn.jsdelivr.net/npm/@fontsource/ibm-plex-sans@5.1.0/files/ibm-plex-sans-latin-400-normal.woff2

saved as `fonts/plex-<weight>-<roman|italic>.woff2` and `fonts/plex-mono.woff2`. Glyphs
outside Latin (Greek, superscripts, ↗) fall back to the system sans.
