# apatel.co

Personal site for Amarnath Patel. Static HTML, no framework, no build step for the pages
themselves, no third-party requests at runtime.

## Layout

    index.html        home
    research.html     project index
      holography.html   photonic lantern characterisation (CREOL)
      celeris.html      RCWA solver / metalens design
      polyoculus.html   telescope array instrumentation
      chameleon.html    AI-detector evaluation
    about.html        education, skills, coursework, talks, honours
      aev.html          solar car telemetry software
    post.html         writing index + markdown renderer
    friends.html      links
    pdf.html          PDF viewer (résumé, CV, papers)
    404.html

    site.css          the whole design system
    nav.js            theme switch, page transitions, scroll reveal, skip links
    vendor/           marked + pdf.js, committed rather than pulled from a CDN
    assets/           camera originals plus everything build-images.sh derives from them
    posts/            markdown

## Regenerating images

Originals live in `assets/`; everything the pages load is derived from them.

    sh scripts/build-images.sh   # photos, figures, per-page social cards
    sh scripts/build-og.sh       # the site-wide social card, from scripts/og.html

Both need ImageMagick (`magick`); `build-og.sh` also needs Chrome or Chromium.

## Adding a post

Drop the markdown in `posts/<slug>.md`, then add it to the `POSTS` array in `post.html`
and to `sitemap.xml`. The home page lists the two latest in static markup — update it too.
