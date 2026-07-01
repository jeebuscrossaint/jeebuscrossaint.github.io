#set page(margin: (x: 0.8in, y: 0.6in))
#set text(font: "Libertinus Serif", size: 10pt)
#set par(justify: false)
#let lc = rgb("#173a5e")

#align(center)[
  #text(size: 15pt, weight: "bold")[AMARNATH S. PATEL]
  #v(0.15em)
  #text(size: 10.5pt)[
    Orlando, FL |
    #link("mailto:amarnath.patel@ucf.edu")[#text(fill: lc)[#underline[amarnath.patel\@ucf.edu]]] |
    #link("https://apatel.co")[#text(fill: lc)[#underline[apatel.co]]] |
    #link("https://github.com/jeebuscrossaint")[#text(fill: lc)[#underline[github.com/jeebuscrossaint]]]
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
  [B.S. in Physics (Optics & Lasers) and Mathematics, Computer Science Minor (38 credit hours)], [August 2025 – Present]
)

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*Florida Atlantic University*], [*3.66 GPA*]
)
#grid(
  columns: (1fr, auto),
  [University coursework completed via FAU High School, ages 14–18 (111 credit hours)], [August 2021 – May 2025]
)

/* ── RESEARCH EXPERIENCE ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[RESEARCH EXPERIENCE]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*#link("https://creol.ucf.edu/astrophotonics/")[#text(fill: lc)[#underline[UCF Astrophotonics Lab]]], CREOL — Undergraduate Researcher*], [August 2025 – Present]
)
#grid(columns: (1fr,), [_Supervisor: Dr. Stephen Eikenberry_])
- Developing instrumentation and automation software for astrophotonics research spanning CREOL and the UCF Physics Department.
- Built an unattended pipeline that measures the wavelength-dependent complex transfer matrix of a photonic lantern via #link("https://github.com/jeebuscrossaint/digital-holography-automation")[#text(fill: lc)[#underline[off-axis digital holography]]], coordinating 4 instruments across all-port × C-band (1525–1575 nm) sweeps at ~92% reconstruction fidelity (building on the method of Dobias et al., _Opt. Express_ 2026).
- Implemented the reconstruction chain: FFT sideband isolation and demodulation, Butterworth filtering, and numerically optimized quadratic-phase correction, feeding LP-mode decomposition to recover complex modal amplitude and phase.
- Developing #link("https://github.com/jeebuscrossaint/pyfocusertest")[#text(fill: lc)[#underline[PolyOculus]]], control and automation software for an 8-telescope photometric observation array; implementing INDI-protocol mount control, focuser automation, RA/Dec coordinate slewing, and backlash compensation.
- Developed Python SDK wrapper (#link("https://github.com/jeebuscrossaint/gentec-camera")[#text(fill: lc)[#underline[gentec-camera]]]) for an IR beam profiling camera enabling automated acquisition, real-time beam analysis, and FITS output.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*UCF Physics Department — Paid Undergraduate Research Assistant*], [March 2026 – Present]
)
#grid(columns: (1fr,), [_Physics Education Research — Supervisor: Dr. Zhongzhou Chen_])
- Developing #link("https://github.com/jeebuscrossaint/estela")[#text(fill: lc)[#underline[ESTELA]]], an automated system that generates multi-version isomorphic physics exams from AI-assisted problem banks for introductory STEM courses.
- Built in Rust with a vanilla JS frontend; parses YAML problem banks across 13 topic areas supporting 11 question types, renders LaTeX math via KaTeX, and exports multi-version exams as LaTeX or print-ready HTML/PDF.
- Funded by NSF award 2421299 and Gates Foundation INV-076932.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: lc)[#underline[FAU Grant-Funded AI Safety Research Project]]] (High School)*], [January 2024 – March 2025]
)
#grid(columns: (1fr,), [_Supervisor: Tucker Hindle, Florida Atlantic University_])
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
  [*Teaching Assistant — Calculus (High School)*], [August 2024 – May 2025]
)
- Assisted 70 undergraduate students with learning calculus; office hours, exam review, grading. Part-time (10 h/week).

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/YamanDevelopment/AEV-Software")[#text(fill: lc)[#underline[Advanced Experimental Vehicles]]] — Programmer, Leader, Builder (High School)*], [November 2023 – May 2025]
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
  column-gutter: 1em,
  [*Batch Processing for Automated Grading via Azure OpenAI*], [June 2026]
)
University of Central Florida, Downtown Campus. ESTELA project (Physics Education Research, Dr. Zhongzhou Chen).

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*Coherence and Detection Approaches for Identifying AI-Generated Text*], [March 2025]
)
Wilkes Honors College Undergraduate Research Symposium, Florida Atlantic University.

/* ── TECHNICAL REPORTS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[TECHNICAL REPORTS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*#link("https://apatel.co/ai-safety.pdf")[#text(fill: lc)[#underline[Coherence and Detection Approaches for Identifying AI-Generated Text]]]*], [2025]
)
- Empirical study of AI-text detection and adversarial evasion: benchmarked 10 coherence and detection methods (GPT-2 perplexity best, 3.35× separation; RoBERTa the only effective detector) and built four evasion pipelines, characterizing a consistent quality–evasion tradeoff. Grant-funded, Florida Atlantic University.

/* ── PROJECTS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[SELECTED PROJECTS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/CELERIS")[#text(fill: lc)[#underline[CELERIS]]] — GPU-Accelerated Metalens Design & EM Solver*], [2026]
)
- From-scratch, validated electromagnetic solver for metalens design via rigorous coupled-wave analysis (RCWA): 1D TE/TM and 2D vectorial formulations, stable scattering-matrix recursion, and dispersion models (Sellmeier, tabulated n,k).
- CUDA-accelerated far-field analysis (600–700× over a 16-core CPU); inverse-design optimizer and fabrication-ready GDSII export, from a CLI or native desktop GUI. C++/CUDA with Python bindings.

#v(0.1em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/coat")[#text(fill: lc)[#underline[coat]]] — Cross-Platform Color-Scheme Configurator*], [2026]
)
- Rust CLI that applies Base16/Base24 color schemes across 22 Linux applications and themes Windows system colors from a single config file; compatible with the ~700-scheme tinted-theming ecosystem, with a terminal scheme browser and live RGB previews.

/* ── SKILLS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[TECHNICAL SKILLS]
#v(0.1em)

*Programming Languages:* C/C++, CUDA, Rust, Python, JavaScript, Shell (Fish, Bash, tcsh), LaTeX/Typst

*Scientific Computing:* NumPy, SciPy, GPU/CUDA acceleration, FFT & signal processing, electromagnetic simulation (RCWA)

*Tools & Libraries:* Qt/PySide6, Docker, Git, CMake, XMake, INDI, KaTeX

*Instrumentation:* GPIB/VISA, RS-232, GigE Vision camera acquisition, tunable IR laser control, motorized polarization control, FITS & GDSII data formats

*Operating Systems:* Linux (Arch, NixOS, Ubuntu), BSD, Windows

/* ── COURSEWORK ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[RELEVANT COURSEWORK]
#v(0.1em)

*University of Central Florida*
#v(0.1em)
_Physics_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Geometric Optics & Lab],                    [Modern Physics \[PHY 3101\]],
  [Quantum Information Processing],             [Mathematical Methods for Physics \[PHZ 3113\]],
  [Independent Research \[PHY 4912\] (In Progress)], [Electricity & Magnetism I (In Progress)],
)

#v(0.15em)
_Mathematics_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Applied Linear Algebra \[MAS 3105\]],        [Complex Analysis \[MAA 4402\]],
  [Linear Algebra (Proof-Based) \[MAS 3106\] (In Progress)], [Partial Differential Equations (In Progress)],
)

#v(0.15em)
_Computer Science_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [C Programming \[EGN 3211\]],                [Discrete Structures],
  [Object-Oriented Programming (In Progress)], [],
)

#v(0.25em)
*Florida Atlantic University*
#v(0.1em)
_Physics_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [General Physics I],                        [General Physics II — Honors],
)

#v(0.15em)
_Mathematics_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Calculus I],                               [Calculus II],
  [Honors Calculus III],                      [Ordinary Differential Equations \[MAP 2302\]],
  [Elementary Matrix Algebra \[MAS 2103\]],   [],
)

#v(0.15em)
_Computer Science_
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.3em,
  [Data Structures & Algorithms],             [Computer Logic Design],
  [Computer Architecture],                    [Deep Learning \[CAP 4613\]],
  [C++ Programming \[COP 3014\]],              [Web Development \[COP 3813\]],
)

/* ── HONORS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[HONORS & AWARDS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [Lockheed Martin Award — "Highest Level of Engineering Excellence," AEV Competition], [2024]
)
#grid(
  columns: (1fr, auto),
  [2nd Place in Division, Advanced Experimental Vehicles Competition], [2024]
)
#grid(
  columns: (1fr, auto),
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025]
)
#grid(
  columns: (1fr, auto),
  [NSF Award 2421299 — Research Funding (ESTELA project, with Dr. Zhongzhou Chen)], [2026]
)
#grid(
  columns: (1fr, auto),
  [Gates Foundation INV-076932 — Research Funding (ESTELA project)], [2026]
)
