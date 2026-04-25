#set page(margin: (x: 0.8in, y: 0.30in))
#set text(font: "Libertinus Serif", size: 8.8pt)
#set par(leading: 0.45em)
#set par(justify: true)
#align(center)[
  #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
  #v(-0.1em)
  #text(size: 10.5pt)[
     #link("mailto:apatel6ty@protonmail.com")[#text(fill: blue)[#underline[apatel6ty\@protonmail.com]]] | #link("https://apatel.co")[#text(fill: blue)[#underline[apatel.co]]] | #link("https://github.com/jeebuscrossaint")[#text(fill: blue)[#underline[github.com/jeebuscrossaint]]]
  ]
  #v(0.1em)
  #text(size: 9pt)[_Research Interests: Photonics, optical instrumentation, physics education, computational methods_]
]
#text(size: 11pt, weight: "bold")[EDUCATION]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(
  columns: (1fr, auto, auto),
  column-gutter: 1em,
  [*University of Central Florida*], [*Undergraduate Student*], [*4.00 GPA*]
)
#v(-0.5em)
#grid(
  columns: (1fr, auto),
  [Physics (Optics & Lasers), Mathematics, Computer Science Minor], [August 2025 - Present]
)
#v(-0.5em)
- Relevant Coursework: Geometric Optics, Matrix & Linear Algebra, Quantum Information Processing, Discrete Computational Structures, Theoretical Methods for Physics
#grid(
  columns: (1fr, auto),
  [*Florida Atlantic University*], [*3.66 GPA*]
)
#v(-0.5em)
#grid(
  columns: (1fr, auto),
  [Computer Science coursework - High School Diploma (111 Credit Hours)], [August 2021 - May 2025]
)
#v(-0.5em)
- Relevant Coursework: Deep Learning, Data Structures & Algorithms, Computer Logic Design, Structured Computer Architecture, Internet Computing
#text(size: 11pt, weight: "bold")[PROFESSIONAL EXPERIENCE]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(columns: (1fr, auto), [*Undergraduate Researcher — Astrophotonics & Instrumentation*], [August 2025 - Present])
#v(-0.6em)
#grid(columns: (1fr,), [_#link("https://creol.ucf.edu/astrophotonics/")[#text(fill: blue)[#underline[UCF Astrophotonics Lab]]], CREOL — Dr. Stephen Eikenberry_])
#v(-0.4em)
- Conducting research at the intersection of photonics and observational astronomy, developing instrumentation software spanning CREOL and the UCF Physics Department.
- Built an automated digital holography pipeline orchestrating 4 instruments (tunable IR laser, fiber switch, motorized polarization controller, GigE InGaAs camera) across 7-leg × 7-wavelength (1540–1570 nm) sweeps.
- Developing PolyOculus, control software for an 8-telescope photometric observation array with INDI-protocol mount control, focuser automation, and RA/Dec coordinate slewing.
#grid(columns: (1fr, auto), [*Research Assistant — Physics Education*], [March 2026 - Present])
#v(-0.6em)
#grid(columns: (1fr,), [_UCF Physics Department — Dr. Zhongzhou Chen_])
#v(-0.4em)
- Developing ESTELA, an automated multi-version exam generation system for AI-assisted isomorphic physics problem banks, supporting scalable and equitable assessment infrastructure for introductory STEM courses.
- Funded by NSF award 2421299 and Gates Foundation INV-076932.
#grid(columns: (1fr, auto), [*Teaching Assistant*], [August 2024 - May 2025])
#v(-0.6em)
#grid(columns: (1fr,), [_Florida Atlantic University_])
#v(-0.4em)
- Assisted 70 undergraduate students with learning calculus; office hours, exam review, and grading. Part-time (10h/week).
#grid(columns: (1fr, auto), [*Software Engineer*], [November 2023 - May 2025])
#v(-0.6em)
#grid(columns: (1fr,), [_#link("https://github.com/YamanDevelopment/AEV-Software")[#text(fill: blue)[#underline[Advanced Experimental Vehicles]]], Florida Atlantic University_])
#v(-0.4em)
- Configured Arch Linux ARM on Raspberry Pi 5 with Hyprland compositor and WireGuard VPN, enabling worldwide real-time telemetry monitoring of BMS, GPS, and camera feeds.
- Won 2nd Place in Division and Lockheed Martin Award for "Highest Level of Engineering Excellence."
#grid(columns: (1fr, auto), [*Researcher — Machine Learning & AI Safety*], [January 2024 - March 2025])
#v(-0.6em)
#grid(columns: (1fr,), [_#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: blue)[#underline[FAU Grant-Funded AI Safety Research Project]]], Florida Atlantic University_])
#v(-0.4em)
- Benchmarked 10+ coherence and detection approaches (BERT NSP, GPT-2 perplexity, RoBERTa, LSA, NLI, burstiness) across 3,125+ generated sequences to evaluate identification of AI-generated text.
- Identified GPT-2 perplexity as the strongest discriminator (3.3× gap); BERT NSP failed to distinguish coherent from incoherent text.
- Characterized a fundamental quality–evasion tradeoff across all humanization approaches; presented at Wilkes Honors College Symposium.
#text(size: 11pt, weight: "bold")[PROJECTS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/estela")[#text(fill: blue)[#underline[ESTELA]]] - Problem Bank Visualizer & Exam Generator*], [March 2026 - Present]
)
#v(-0.5em)
- Built in Rust with a vanilla JS frontend; parses YAML problem banks across 13 topic areas supporting 11 question types.
- Renders LaTeX math via KaTeX and exports multi-version exams as LaTeX or print-ready HTML/PDF.
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/digital-holography-automation")[#text(fill: blue)[#underline[Photonic Lantern Digital Holography Automation]]]*], [January 2026 - Present]
)
#v(-0.5em)
- Automated data acquisition and processing pipeline for photonic lantern characterization via digital holography across 7-leg × 7-wavelength (1540–1570 nm) sweeps.
- Implements FFT-based fringe extraction, automated polarization optimization, and full 7-mode LP decomposition.
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/pyfocusertest")[#text(fill: blue)[#underline[PolyOculus]]]*], [January 2026 - Present]
)
#v(-0.5em)
- INDI-protocol mount control, automated focuser, RA/Dec slewing, and backlash compensation for an 8-telescope photometric observation array.
- Part of ongoing astrophotonics research at UCF CREOL under Dr. Eikenberry.
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/gentec-camera")[#text(fill: blue)[#underline[gentec-camera]]]*], [November 2025]
)
#v(-0.5em)
- Python SDK wrapper for IR beam profiling camera enabling automated acquisition and real-time beam analysis.
- Outputs FITS format for integration with optical instrumentation research pipelines.
#text(size: 11pt, weight: "bold")[SKILLS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
*Languages:* C/C++, Rust, Python, VHDL, Shell (Fish, Bash, tcsh) \
#v(-0.6em)
*Tools & Frameworks:* Docker, Git, CMake, XMake, NumPy, SciPy, INDI, VirtualBox, VMware, QEMU \
#v(-0.6em)
*Operating Systems:* Linux Distributions, BSD, Windows
