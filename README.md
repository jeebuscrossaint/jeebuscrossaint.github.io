# apatel.co

Personal site for Amarnath Patel. Static HTML, no framework, no build step for the pages
themselves, **no JavaScript at all**, no third-party requests at runtime.

## Layout

    index.html        home — the card: who, work, writing, links
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
    fonts/            Libertinus Serif + Mono, subset to this site's glyphs
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

Subset from the system Libertinus OTFs — the same files Typst uses for the CV, so print
and web match. Needs `fonttools`:

    pyftsubset /usr/share/fonts/libertinus/LibertinusSerif-Regular.otf \
      --text-file=chars.txt --flavor=woff2 --layout-features='kern,liga' \
      --desubroutinize --output-file=fonts/lib-400-roman.woff2

Keep the hinting (don't pass `--no-hinting`) — without it the type renders soft on
Linux/FreeType.
