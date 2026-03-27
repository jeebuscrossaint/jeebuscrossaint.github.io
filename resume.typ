#set page(margin: (x: 0.8in, y: 0.38in))
#set text(font: "Libertinus Serif", size: 8.8pt)
#set par(leading: 0.55em)
#set par(justify: true)
#align(center)[
  #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
  #v(0.06em)
  #text(size: 10.5pt)[
     #link("mailto:apatel6ty@protonmail.com")[#text(fill: blue)[#underline[apatel6ty\@protonmail.com]]] | #link("https://apatel.co")[#text(fill: blue)[#underline[apatel.co]]] | #link("https://github.com/jeebuscrossaint")[#text(fill: blue)[#underline[github.com/jeebuscrossaint]]] | +1 561-603-2661
  ]
]
#v(0.08em)
#line(length: 100%, stroke: 0.5pt)
#v(0.03em)
#text(size: 11pt, weight: "bold")[EDUCATION]
#v(0.03em)
#grid(
  columns: (1fr, auto, auto),
  column-gutter: 1em,
  [*University of Central Florida*], [*Undergraduate Student*], [*4.00 GPA*]
)
#grid(
  columns: (1fr, auto),
  [Physics (Optics & Lasers), Mathematics, Computer Science Minor], [August 2025 - Present]
)
- Relevant Coursework: Geometric Optics, Matrix & Linear Algebra, Quantum Information Processing, Discrete Computational Structures, Theoretical Methods for Physics, Statistical Methods 1
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*Florida Atlantic University*], [*3.66 GPA*]
)
#grid(
  columns: (1fr, auto),
  [Computer Science coursework - High School Diploma (111 Credit Hours)], [August 2021 - May 2025]
)
#v(0.06em)
#text(size: 11pt, weight: "bold")[SKILLS]
#v(0.03em)
*Programming Languages:* C/C++, Rust, Python, Shell (Fish, Bash, tcsh)

*Tools & Frameworks:* Docker, Git, CMake, XMake, NumPy, SciPy, INDI

*Operating Systems:* Linux Distributions, BSD, Windows

#v(0.06em)
#text(size: 11pt, weight: "bold")[PROFESSIONAL EXPERIENCE]
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*#link("https://creol.ucf.edu/astrophotonics/")[#text(fill: blue)[#underline[UCF Astrophotonics Lab]]] - Undergraduate Researcher*], [August 2025 - Present]
)
- Developing instrumentation and automation software for astrophotonics research under Dr. Stephen Eikenberry; primary outputs include a digital holography pipeline characterizing photonic lanterns via 7-mode LP decomposition (4-instrument orchestration across 1540–1570 nm) and PolyOculus, control software for an 8-telescope photometric observation array.
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*UCF Physics Department - Paid Undergraduate Research Assistant*], [March 2026 - Present]
)
#grid(
  columns: (1fr,),
  [Physics Education Research under Dr. Zhongzhou Chen]
)
- Developing ESTELA, an automated multi-version exam generation system for AI-assisted isomorphic physics problem banks, supporting scalable and equitable assessment infrastructure for introductory STEM courses; funded by NSF-2421299 and Gates Foundation INV-076932.
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*Teaching Assistant - Employee*], [August 2024 - May 2025]
)
- Assisted 70 undergraduate students with learning calculus. Part-time position (10h/week).
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/YamanDevelopment/AEV-Software")[#text(fill: blue)[#underline[Advanced Experimental Vehicles]]] - Programmer, Leader, Builder*], [November 2023 - May 2025]
)
- Configured Arch Linux ARM on Raspberry Pi 5 with Hyprland compositor and WireGuard VPN, enabling worldwide real-time telemetry monitoring of BMS, GPS, and camera feeds; won 2nd Place in Division and Lockheed Martin Award for "Highest Level of Engineering Excellence."
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: blue)[#underline[FAU Grant-Funded AI Safety Research Project]]]*], [January 2024 - March 2025]
)
- Benchmarked 10+ coherence and detection methods (BERT NSP, GPT-2 perplexity, RoBERTa, LSA, NLI, burstiness) across 3,125+ generated sequences; identified GPT-2 perplexity as the strongest discriminator (3.3× gap between coherent and incoherent text; BERT NSP failed to distinguish) and characterized a fundamental quality–evasion tradeoff across all humanization approaches; presented at Wilkes Honors College Symposium.
#v(0.06em)
#text(size: 11pt, weight: "bold")[PROJECTS]
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*ESTELA - Problem Bank Visualizer & Exam Generator*], [March 2026 - Present]
)
- Built in Rust with a vanilla JS frontend; parses YAML problem banks across 13 topic areas supporting 11 question types, renders LaTeX math via KaTeX, and exports multi-version exams as LaTeX or print-ready HTML/PDF.
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*Photonic Lantern Digital Holography Automation*], [January 2026 - Present]
)
- Automated end-to-end data acquisition and processing pipeline for characterizing photonic lanterns via digital holography; orchestrates 4 instruments (tunable IR laser, fiber switch, motorized polarization controller, GigE InGaAs camera) across 7-leg × 7-wavelength (1540–1570 nm) sweeps, with FFT-based fringe extraction and 7-mode LP decomposition.
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/pyfocusertest")[#text(fill: blue)[#underline[PolyOculus]]]*], [January 2026 - Present]
)
- Developing control and automation software for an 8-telescope photometric observation array; implementing INDI-protocol mount control, focuser automation, RA/Dec coordinate slewing, and backlash compensation as part of ongoing astrophotonics research at UCF CREOL
#v(0.03em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/gentec-camera")[#text(fill: blue)[#underline[gentec-camera]]]*], [November 2025]
)
- Developed Python SDK wrapper for IR beam profiling camera enabling automated data acquisition, real-time beam analysis, and FITS output for optical instrumentation research.
