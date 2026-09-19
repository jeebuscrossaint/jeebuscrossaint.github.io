// Shared style for the targeted résumé variants (resume-*.typ).
// The general résumé (resume.typ) and the full CV (cv.typ) stay self-contained.
//
//   #import "resume-style.typ": *
//   #show: resume.with(size: 8.8pt)

#let lc = rgb("#173a5e")

// A link, in the house style: colour + underline.
#let lnk(url, body) = link(url)[#text(fill: lc)[#underline[#body]]]

// Section heading with its rule tucked underneath.
#let sect(title) = block(above: 0.85em, below: 0.35em)[
  #text(size: 10.5pt, weight: "bold")[#title]
  #v(-0.95em)
  #line(length: 100%, stroke: 0.4pt)
]

// Entry title on the left, dates flushed right.
#let entry(left, right) = block(above: 0.65em, below: 0.2em)[
  #grid(columns: (1fr, auto), column-gutter: 1em, left, right)
]

// The italic supervisor / funding line that sits under an entry.
#let sub(body) = block(above: 0.15em, below: 0.2em)[#text(style: "italic")[#body]]

// Two-column school block: name + status + GPA, then degree + dates.
#let school(name, status, gpa, degree, dates) = {
  block(above: 0.4em, below: 0.15em)[
    #grid(columns: (1fr, auto, auto), column-gutter: 1em,
      [*#name*], [*#status*], [*#gpa*])
  ]
  block(above: 0.15em, below: 0.2em)[
    #grid(columns: (1fr, auto), column-gutter: 1em, degree, dates)
  ]
}

// A right-aligned dated list, for honours and the like.
#let dated(..rows) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  row-gutter: 0.45em,
  ..rows,
)

#let resume(size: 8.8pt, ymargin: 0.4in, leading: 0.45em, orcid: false, tagline: none, body) = {
  set page(margin: (x: 0.75in, y: ymargin))
  set text(font: "Libertinus Serif", size: size)
  set par(leading: leading, justify: true)
  set list(indent: 0pt, body-indent: 0.4em, spacing: 0.42em)
  show list: set block(above: 0.3em, below: 0.3em)

  align(center)[
    #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
    #v(-0.1em)
    #text(size: 9.6pt)[
      Orlando, FL |
      #lnk("mailto:amarnath.patel@ucf.edu")[amarnath.patel\@ucf.edu] |
      #lnk("https://apatel.co")[apatel.co] |
      #lnk("https://github.com/jeebuscrossaint")[github.com/jeebuscrossaint]
      #if orcid [ | #lnk("https://orcid.org/0009-0008-9460-082X")[ORCID 0009-0008-9460-082X]]
    ]
    #if tagline != none [
      #v(-0.4em)
      #text(size: 9pt, style: "italic")[#tagline]
    ]
  ]

  body
}
