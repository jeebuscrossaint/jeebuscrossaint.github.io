#!/usr/bin/env sh
# Derive the web-ready photos in assets/ from the camera originals.
# Run from the repo root:  sh scripts/build-images.sh
#
# Originals stay in the repo untouched so these are always reproducible. Everything the
# pages load is generated here: WebP plus a JPEG fallback, EXIF stripped (it carries
# camera and capture data you don't want on a public site).
#
# ONE web width per photo, not a responsive ladder. The layout caps figures at 40rem
# (640 CSS px), so the widths below already cover a 2-3x display; a 2400px variant was
# dead weight. If the layout ever widens, add widths back here and srcset to the pages.
set -e
command -v magick >/dev/null || { echo "ImageMagick 'magick' not found" >&2; exit 1; }

Q=82
web() {  # web <source> <out-basename> <width> [crop]
  src=$1; out=$2; w=$3; crop=$4
  if [ -n "$crop" ]; then
    magick "$src" -crop "$crop" +repage -strip -quality $Q -resize "${w}x" "assets/$out.jpg"
  else
    magick "$src" -strip -quality $Q -resize "${w}x>" "assets/$out.jpg"
  fi
  magick "assets/$out.jpg" -quality $Q "assets/$out.webp"
}

# bench-top: the overhead shot. Cropped to 2560x1150 to drop the floor and shoes at the
# bottom, leaving ~2.2:1.
web assets/dha1.jpg bench-top-1400 1400 2560x1150+0+0

# PolyOculus programme figures. Sources are only 1024px wide, so never upscaled.
web assets/cosmic_accel-1024x770.png polyoculus-concept-1024 1024
web assets/polyo_cost-1024x711.png   polyoculus-cost-1024    1024

# symposium: 4:3 group photo cropped to the band the people occupy.
web assets/wilkeshonorspresentation.jpg symposium-1400 1400 5712x2448+0+700

# AEV cockpit: already ~2.16:1, so this only resizes.
web assets/donotletzachdrivethecar.jpg aev-cockpit-1400 1400

# AEV team: shown whole as a figure, never cropped.
web assets/gradpicturealset.jpg aev-team-1200 1200

# portrait: shown in an 11rem column, so 640 covers it at 3x.
[ -f assets/mayormaynotbeaigenerated.png ] && web assets/mayormaynotbeaigenerated.png me-640 640

# Per-page social cards, 1200x630, cut straight from the originals rather than from an
# intermediate — more pixels to downsample from, and no 2400px file to keep around.
card() { magick "$1" -resize 1200x630^ -gravity center -crop 1200x630+0+0 +repage \
         -strip -quality 84 "assets/$2.jpg"; }
card assets/dha1.jpg                    og-holography
card assets/donotletzachdrivethecar.jpg og-aev
card assets/wilkeshonorspresentation.jpg og-chameleon
card assets/cosmic_accel-1024x770.png   og-polyoculus

echo "generated:"
for f in assets/bench-top-1400.* assets/polyoculus-*-1024.* assets/symposium-1400.* \
         assets/aev-cockpit-1400.* assets/aev-team-1200.* assets/me-640.* assets/og-*.jpg; do
  printf "  %-34s %6s KB  %s\n" "$f" "$(( $(wc -c < "$f") / 1024 ))" "$(magick identify -format '%wx%h' "$f")"
done
