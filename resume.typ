#set page(margin: (x: 0.8in, y: 0.3in))
#set text(font: "Libertinus Serif", size: 8.8pt)
#set par(leading: 0.43em)
#set par(justify: true)
#align(center)[
  #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
  #v(-0.1em)
  #text(size: 10.5pt)[
     #link("mailto:apatel6ty@protonmail.com")[#text(fill: blue)[#underline[apatel6ty\@protonmail.com]]] | #link("https://apatel.co")[#text(fill: blue)[#underline[apatel.co]]] | #link("https://github.com/jeebuscrossaint")[#text(fill: blue)[#underline[github.com/jeebuscrossaint]]]
  ]
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
- Relevant Coursework: Deep Learning, Data Structures & Algorithms, Computer Logic Design, Structured Computer Architecture
#text(size: 11pt, weight: "bold")[PROFESSIONAL EXPERIENCE]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(columns: (1fr, auto), [*Instrumentation Software Engineer — Research*], [August 2025 - Present])
#v(-0.6em)
#grid(columns: (1fr,), [_#link("https://creol.ucf.edu/astrophotonics/")[#text(fill: blue)[#underline[UCF Astrophotonics Lab]]], CREOL — Dr. Stephen Eikenberry_])
#v(-0.4em)
- Built an automated digital holography pipeline coordinating 4 lab instruments (HP 8168E tunable IR laser, DiCon GP700 7-port fiber switch, Thorlabs MPC320 polarization controller, Xenics Bobcat 320 GigE InGaAs camera) over GPIB/VISA, RS-232, and GigE Vision across port × wavelength C-band sweeps (1525–1575 nm).
- Developing PolyOculus, control software for an 8-telescope photometric observation array with INDI-protocol mount control, focuser automation, and RA/Dec coordinate slewing.
#grid(columns: (1fr, auto), [*Software Engineer — Research*], [March 2026 - Present])
#v(-0.6em)
#grid(columns: (1fr,), [_UCF Physics Department — Dr. Zhongzhou Chen_])
#v(-0.4em)
- Developing ESTELA, an automated exam generation system that produces multi-version isomorphic physics exams from a 615-problem bank, supporting scalable and equitable assessment infrastructure for introductory STEM courses.
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
#grid(columns: (1fr, auto), [*AI/ML Software Engineer — Research*], [January 2024 - March 2025])
#v(-0.6em)
#grid(columns: (1fr,), [_#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: blue)[#underline[FAU Grant-Funded AI Safety Research Project]]], Florida Atlantic University_])
#v(-0.4em)
- Benchmarked 10 coherence and detection methods (GPT-2 perplexity, BERT NSP, RoBERTa, LSA, NLI, burstiness) on a 255K-passage corpus to evaluate identification of AI-generated text.
- Identified GPT-2 perplexity as the strongest discriminator (3.35× separation, 17.5 vs 58.5); BERT NSP failed to distinguish coherent from incoherent text.
- Built 4 adversarial evasion pipelines (iterative rewriting, tree-search decoding, list-branching, RL) generating 3,125 sequences; characterized a consistent quality–evasion tradeoff. Presented at Wilkes Honors College Symposium.
#text(size: 11pt, weight: "bold")[PROJECTS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/estela")[#text(fill: blue)[#underline[ESTELA]]] - Problem Bank Visualizer & Exam Generator*], [March 2026 - Present]
)
#v(-0.5em)
- Built in Rust (Tauri 2) with a vanilla JS frontend; parses 615 problems across 29 YAML banks spanning 13 topic areas and 11 question types.
- Generates up to 10 isomorphic exam versions with auto-generated answer keys; renders LaTeX math via KaTeX and exports to 4 formats (LaTeX, Word, HTML, ZIP bundle).
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/digital-holography-automation")[#text(fill: blue)[#underline[Photonic Lantern Digital Holography Automation]]]*], [January 2026 - Present]
)
#v(-0.5em)
- Automated data acquisition and processing pipeline for photonic lantern characterization via off-axis digital holography across port × wavelength C-band sweeps (1525–1575 nm).
- Implements FFT sideband demodulation, order-4 Butterworth filtering, quadratic-phase correction, and 8-mode LP decomposition at ~98% reconstruction fidelity.
#grid(
  columns: (1fr, auto),
  [*#link("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[#text(fill: blue)[#underline[PolyOculus]]]*], [January 2026 - Present]
)
#v(-0.5em)
- INDI-protocol mount control, automated focuser, RA/Dec slewing, and backlash compensation for an 8-telescope photometric observation array; part of ongoing astrophotonics research at UCF CREOL.
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/CELERIS")[#text(fill: blue)[#underline[CELERIS]]] — Metalens Design Pipeline & From-Scratch RCWA Solver*], [2026]
)
#v(-0.5em)
- From-scratch, validated electromagnetic solver for metalens design via rigorous coupled-wave analysis (1D TE/TM + 2D vectorial, scattering-matrix recursion, Sellmeier/tabulated dispersion); cross-validated against the grcwa and Stanford S#super[4] solvers (agreement to 1e-7) and reproduces published metalenses (Khorasaninejad 2016, Chen 2018).
- End-to-end design→analysis→GDSII pipeline: meta-atom library sweeps, achromatic & Pancharatnam–Berry design, optical-analysis battery, GPU-accelerated far-field propagation, and fabrication-ready layout export. C++/CUDA with Python bindings; manuscript in preparation.
#text(size: 11pt, weight: "bold")[SKILLS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
*Languages:* C/C++, CUDA, Rust, Python, VHDL, Shell (Fish, Bash, tcsh) \
#v(-0.6em)
*Tools & Frameworks:* Docker, Git, CMake, XMake, NumPy, SciPy, INDI, VirtualBox, VMware, QEMU \
#v(-0.6em)
*Operating Systems:* Linux Distributions, BSD, Windows
