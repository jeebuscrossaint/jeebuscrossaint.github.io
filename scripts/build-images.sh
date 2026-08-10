#!/usr/bin/env sh
# Derive the web-ready photos in assets/ from the camera originals (assets/dha*.jpg).
# Run from the repo root:  sh scripts/build-images.sh
#
# Originals stay in the repo untouched so these are always reproducible. Everything the
# pages actually load is generated here: two widths per photo, WebP plus a JPEG fallback,
# EXIF stripped (it carries camera and location data you don't want on a public site).
set -e
command -v magick >/dev/null || { echo "ImageMagick 'magick' not found" >&2; exit 1; }

Q=82

# bench-top: the overhead shot. Cropped to 2560x1150 to drop the floor and shoes at the
# bottom — that leaves ~2.2:1, which is close to the 21:9 hero slot, so the CSS barely crops.
magick assets/dha1.jpg -crop 2560x1150+0+0 +repage -strip -quality $Q -resize 2400x assets/bench-top-2400.jpg
magick assets/dha1.jpg -crop 2560x1150+0+0 +repage -strip -quality $Q -resize 1400x assets/bench-top-1400.jpg
magick assets/bench-top-2400.jpg -quality $Q assets/bench-top-2400.webp
magick assets/bench-top-1400.jpg -quality $Q assets/bench-top-1400.webp

# NOTE: assets/dha2.jpg (the wide room shot) is kept but currently unused — no page links
# it. Add a block here like the one above if it earns a slot again.

# PolyOculus programme figures. Sources are only 1024px wide, so these are never upscaled —
# just re-encoded and given a smaller variant for phones. Diagrams, so they are shown
# uncropped at their natural aspect rather than through a .media frame.
magick assets/cosmic_accel-1024x770.png -strip -quality $Q assets/polyoculus-concept-1024.jpg
magick assets/cosmic_accel-1024x770.png -strip -quality $Q -resize 640x assets/polyoculus-concept-640.jpg
magick assets/polyoculus-concept-1024.jpg -quality $Q assets/polyoculus-concept-1024.webp
magick assets/polyoculus-concept-640.jpg -quality $Q assets/polyoculus-concept-640.webp

magick assets/polyo_cost-1024x711.png -strip -quality $Q assets/polyoculus-cost-1024.jpg
magick assets/polyo_cost-1024x711.png -strip -quality $Q -resize 640x assets/polyoculus-cost-640.jpg
magick assets/polyoculus-cost-1024.jpg -quality $Q assets/polyoculus-cost-1024.webp
magick assets/polyoculus-cost-640.jpg -quality $Q assets/polyoculus-cost-640.webp

# symposium: 4:3 group photo cropped to the band the people occupy, so the 21:9 hero frame
# doesn't take the tops of anyone's heads off.
magick assets/wilkeshonorspresentation.jpg -crop 5712x2448+0+700 +repage -strip -quality $Q -resize 2400x assets/symposium-2400.jpg
magick assets/symposium-2400.jpg -strip -quality $Q -resize 1400x assets/symposium-1400.jpg
magick assets/symposium-2400.jpg -quality $Q assets/symposium-2400.webp
magick assets/symposium-1400.jpg -quality $Q assets/symposium-1400.webp

# AEV cockpit: already ~2.16:1, so the hero frame barely trims it.
magick assets/donotletzachdrivethecar.jpg -strip -quality $Q -resize 2400x assets/aev-cockpit-2400.jpg
magick assets/aev-cockpit-2400.jpg -strip -quality $Q -resize 1400x assets/aev-cockpit-1400.jpg
magick assets/aev-cockpit-2400.jpg -quality $Q assets/aev-cockpit-2400.webp
magick assets/aev-cockpit-1400.jpg -quality $Q assets/aev-cockpit-1400.webp

# AEV team: shown whole as a figure, never cropped.
magick assets/gradpicturealset.jpg -strip -quality $Q -resize 2000x assets/aev-team-2000.jpg
magick assets/aev-team-2000.jpg -strip -quality $Q -resize 1200x assets/aev-team-1200.jpg
magick assets/aev-team-2000.jpg -quality $Q assets/aev-team-2000.webp
magick assets/aev-team-1200.jpg -quality $Q assets/aev-team-1200.webp

# Per-page social cards, 1200x630. A shared link should preview the actual work, not the same
# generic name card every time. Sources are all wider than 1.905:1, so these crop to centre.
magick assets/bench-top-2400.jpg   -resize 1200x630^ -gravity center -crop 1200x630+0+0 +repage -strip -quality 84 assets/og-holography.jpg
magick assets/aev-cockpit-2400.jpg -resize 1200x630^ -gravity center -crop 1200x630+0+0 +repage -strip -quality 84 assets/og-aev.jpg
magick assets/symposium-2400.jpg   -resize 1200x630^ -gravity center -crop 1200x630+0+0 +repage -strip -quality 84 assets/og-chameleon.jpg
magick assets/polyoculus-concept-1024.jpg -resize 1200x630^ -gravity center -crop 1200x630+0+0 +repage -strip -quality 84 assets/og-polyoculus.jpg

# portrait: the hero frame is 2:3 to match the source, so this only resizes — the picture is
# shown whole, nothing cropped. Skipped silently if the file isn't there yet.
if [ -f assets/mayormaynotbeaigenerated.png ]; then
  # '>' only ever shrinks — the source is ~1023px wide and upscaling it would add bytes
  # without adding detail. 1024 covers the 26rem frame at 2x.
  magick assets/mayormaynotbeaigenerated.png -resize '1024x>' -strip -quality $Q assets/me-1024.jpg
  magick assets/me-1024.jpg -strip -quality $Q -resize '640x>' assets/me-640.jpg
  magick assets/me-1024.jpg -quality $Q assets/me-1024.webp
  magick assets/me-640.jpg  -quality $Q assets/me-640.webp
fi

echo "generated:"
for f in assets/bench-top-*.jpg assets/bench-top-*.webp assets/polyoculus-*.jpg assets/polyoculus-*.webp assets/symposium-*.jpg assets/symposium-*.webp assets/aev-*.jpg assets/aev-*.webp assets/og-*.jpg assets/me-*.jpg assets/me-*.webp; do
  printf "  %-32s %6s KB  %s\n" "$f" "$(( $(wc -c < "$f") / 1024 ))" "$(magick identify -format '%wx%h' "$f")"
done
