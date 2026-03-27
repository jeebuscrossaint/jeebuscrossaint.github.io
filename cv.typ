#set page(margin: (x: 0.8in, y: 0.6in))
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: true)

#align(center)[
  #text(size: 15pt, weight: "bold")[AMARNATH S. PATEL]
  #v(0.15em)
  #text(size: 10.5pt)[
    #link("mailto:apatel6ty@protonmail.com")[#text(fill: blue)[#underline[apatel6ty\@protonmail.com]]] |
    #link("https://apatel.co")[#text(fill: blue)[#underline[apatel.co]]] |
    #link("https://github.com/jeebuscrossaint")[#text(fill: blue)[#underline[github.com/jeebuscrossaint]]] |
    +1 561-603-2661
  ]
]
#v(0.2em)
#line(length: 100%, stroke: 0.5pt)

/* ── EDUCATION ── */
#v(0.1em)
#text(size: 11pt, weight: "bold")[EDUCATION]
#v(0.1em)

#grid(
  columns: (1fr, auto, auto),
  column-gutter: 1em,
  [*University of Central Florida*], [*Undergraduate Student*], [*4.00 GPA*]
)
#grid(
  columns: (1fr, auto),
  [Physics (Optics & Lasers), Mathematics — Computer Science Minor], [August 2025 – Present]
)

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*Florida Atlantic University*], [*3.66 GPA*]
)
#grid(
  columns: (1fr, auto),
  [Computer Science coursework concurrent with High School Diploma (111 Credit Hours)], [August 2021 – May 2025]
)

/* ── RESEARCH EXPERIENCE ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[RESEARCH EXPERIENCE]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*#link("https://creol.ucf.edu/astrophotonics/")[#text(fill: blue)[#underline[UCF Astrophotonics Lab]]], CREOL — Undergraduate Researcher*], [August 2025 – Present]
)
#grid(columns: (1fr,), [_Supervisor: Dr. Stephen Eikenberry_])
- Developing instrumentation and automation software for astrophotonics research at the intersection of photonics and observational astronomy, spanning CREOL and the UCF Physics Department.
- Built an automated end-to-end data acquisition and processing pipeline for characterizing photonic lanterns via digital holography; orchestrates 4 instruments (tunable IR laser, fiber switch, motorized polarization controller, GigE InGaAs camera) across 7-leg × 7-wavelength (1540–1570 nm) sweeps, with FFT-based fringe extraction and 7-mode LP decomposition.
- Developing PolyOculus, control and automation software for an 8-telescope photometric observation array; implementing INDI-protocol mount control, focuser automation, RA/Dec coordinate slewing, and backlash compensation.
- Developed Python SDK wrapper (gentec-camera) for an IR beam profiling camera enabling automated acquisition, real-time beam analysis, and FITS output.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*UCF Physics Department — Paid Undergraduate Research Assistant*], [March 2026 – Present]
)
#grid(columns: (1fr,), [_Physics Education Research — Supervisor: Dr. Zhongzhou Chen_])
- Developing ESTELA, an automated multi-version exam generation system for AI-assisted isomorphic physics problem banks, supporting scalable and equitable assessment infrastructure for introductory STEM courses.
- Built in Rust with a vanilla JS frontend; parses YAML problem banks across 13 topic areas supporting 11 question types, renders LaTeX math via KaTeX, and exports multi-version exams as LaTeX or print-ready HTML/PDF.
- Funded by NSF award 2421299 and Gates Foundation INV-076932.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: blue)[#underline[FAU Grant-Funded AI Safety Research Project]]]*], [January 2024 – March 2025]
)
- Benchmarked 10+ coherence and detection methods (BERT NSP, GPT-2 perplexity, RoBERTa, LSA, NLI, burstiness) across 3,125+ generated sequences to evaluate approaches for identifying AI-generated text.
- Identified GPT-2 perplexity as the strongest discriminator (3.3× gap between coherent and incoherent text); BERT NSP failed to distinguish the two.
- Characterized a fundamental quality–evasion tradeoff across all humanization approaches tested, including iterative sampling, content abstraction, and RL-based methods.
- Grant-funded with HPC access; findings presented at the Wilkes Honors College Symposium (2025).

/* ── OTHER EXPERIENCE ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[OTHER EXPERIENCE]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Teaching Assistant — Calculus*], [August 2024 – May 2025]
)
- Assisted 70 undergraduate students with learning calculus; office hours, exam review, grading. Part-time (10 h/week).

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/YamanDevelopment/AEV-Software")[#text(fill: blue)[#underline[Advanced Experimental Vehicles]]] — Programmer, Leader, Builder*], [November 2023 – May 2025]
)
- Configured Arch Linux ARM on Raspberry Pi 5 with Hyprland compositor and WireGuard VPN, enabling worldwide real-time telemetry monitoring of BMS, GPS, and camera feeds.
- Won 2nd Place in Division and Lockheed Martin Award for "Highest Level of Engineering Excellence."

/* ── PRESENTATIONS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[PRESENTATIONS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Coherence and Detection Approaches for Identifying AI-Generated Text*], [2025]
)
Wilkes Honors College Undergraduate Research Symposium, Florida Atlantic University.

/* ── PROJECTS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[SELECTED PROJECTS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Photonic Lantern Digital Holography Automation*], [January 2026 – Present]
)
- Automated data acquisition and processing pipeline for photonic lantern characterization via digital holography. Orchestrates tunable IR laser, fiber switch, motorized polarization controller, and GigE InGaAs camera across 7-leg × 7-wavelength sweeps (1540–1570 nm). Implements FFT-based fringe extraction and full 7-mode LP decomposition.

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/pyfocusertest")[#text(fill: blue)[#underline[PolyOculus]]] — 8-Telescope Array Control Software*], [January 2026 – Present]
)
- INDI-protocol mount control, automated focuser, RA/Dec slewing, and backlash compensation for an 8-telescope photometric observation array. Part of ongoing astrophotonics research at UCF CREOL.

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*ESTELA — Problem Bank Visualizer & Exam Generator*], [March 2026 – Present]
)
- Rust backend, vanilla JS frontend. Parses YAML problem banks across 13 topic areas and 11 question types. Renders LaTeX via KaTeX. Exports multi-version exams as LaTeX or print-ready HTML/PDF. NSF/Gates-funded research tool.

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/gentec-camera")[#text(fill: blue)[#underline[gentec-camera]]] — IR Beam Profiling SDK*], [November 2025]
)
- Python SDK wrapper for Gentec IR beam profiling camera. Automated acquisition, real-time Gaussian beam analysis, FITS output for optical instrumentation research.

/* ── SKILLS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[TECHNICAL SKILLS]
#v(0.1em)

*Programming Languages:* C/C++, Rust, Python, Shell (Fish, Bash, tcsh)

*Libraries & Frameworks:* NumPy, SciPy, Docker, Git, CMake, XMake, INDI

*Instrumentation:* Tunable IR laser control, GigE camera acquisition, fiber switch automation, motorized polarization control, FITS data format

*Operating Systems:* Linux (Arch, NixOS, Ubuntu), BSD, Windows

/* ── COURSEWORK ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[RELEVANT COURSEWORK]
#v(0.1em)

*Physics*
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Geometric Optics & Lab (A)],               [General Physics I (C+)],
  [General Physics II — Honors (A)],           [General Physics III (A)],
  [Chemistry Fundamentals I (A)],              [Chemistry Fundamentals II (IP)],
  [Mechanics I (IP)],                          [Quantum Information Processing (IP)],
  [Theoretical Methods for Physics (IP)],      [],
)

#v(0.2em)
*Mathematics*
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Calculus I (A−)],                           [Calculus II (A−)],
  [Honors Calculus III (A)],                   [Differential Equations (A)],
  [Matrix Theory (B)],                         [Matrix & Linear Algebra (IP)],
  [Linear Algebra (IP)],                       [Introduction to Complex Variables (IP)],
  [Intro to Partial Differential Equations (IP)], [Introduction to Graph Theory (IP)],
  [Statistical Methods I (IP)],                [Statistical Methods II (IP)],
)

#v(0.2em)
*Computer Science*
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Data Structures & Algorithms (A)],          [Computer Logic Design (A)],
  [Computer Architecture (A−)],                [Intro to Deep Learning (A)],
  [Discrete Structures (IP)],                  [Engineering Analysis & Computation (A)],
  [Foundations of Computing (A)],              [],
)

/* ── HONORS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[HONORS & AWARDS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [Lockheed Martin Award — "Highest Level of Engineering Excellence," AEV Competition], [2025]
)
#grid(
  columns: (1fr, auto),
  [2nd Place in Division, Advanced Experimental Vehicles Competition], [2025]
)
#grid(
  columns: (1fr, auto),
  [NSF Award 2421299 — Research Funding (ESTELA project, with Dr. Zhongzhou Chen)], [2026]
)
#grid(
  columns: (1fr, auto),
  [Gates Foundation INV-076932 — Research Funding (ESTELA project)], [2026]
)
