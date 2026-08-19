#set page(margin: (x: 0.75in, y: 0.35in))
#set text(font: "Libertinus Serif", size: 8.6pt)
#set par(leading: 0.43em)
#set par(justify: true)
#let lc = rgb("#173a5e")

#align(center)[
  #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
  #v(-0.1em)
  #text(size: 10pt)[
    Orlando, FL |
    #link("mailto:amarnath.patel@ucf.edu")[#text(fill: lc)[#underline[amarnath.patel\@ucf.edu]]] |
    #link("https://apatel.co")[#text(fill: lc)[#underline[apatel.co]]] |
    #link("https://github.com/jeebuscrossaint")[#text(fill: lc)[#underline[github.com/jeebuscrossaint]]]
  ]
]

#text(size: 10.5pt, weight: "bold")[EDUCATION]
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
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor], [August 2025 – Expected May 2029]
)
#v(-0.5em)
- *Mathematics:* Applied Linear Algebra, Linear Algebra (proof-based, in progress), Complex Analysis, Partial Differential Equations (in progress), Mathematical Methods for Physics, Ordinary Differential Equations, Honors Calculus III, Discrete Structures
#v(-0.35em)
- *Physics:* Quantum Information Processing, Modern Physics, Geometric Optics & Lab, Electricity & Magnetism I (in progress), Independent Research
#v(-0.35em)
#grid(
  columns: (1fr, auto, auto),
  column-gutter: 1em,
  [*Florida Atlantic University*], [University coursework via FAU High School, ages 14–18 (111 credit hours)], [*3.66 GPA*]
)
#v(-0.5em)
- Deep Learning, Data Structures & Algorithms, Computer Architecture, Computer Logic Design

#text(size: 10.5pt, weight: "bold")[RESEARCH EXPERIENCE]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/CELERIS")[#text(fill: lc)[#underline[CELERIS]]] — Independent Research: From-Scratch RCWA Solver & Metalens Design Pipeline*], [2026]
)
#v(-0.5em)
- Built a from-scratch solver for Maxwell's equations in periodic subwavelength structures via rigorous coupled-wave analysis: 1D TE/TM gratings with Li/Liu–Fan inverse-rule factorization, full 2D-vectorial formulation for biperiodic arrays, and stable Redheffer scattering-matrix recursion.
#v(-0.35em)
- Validated every layer of the stack against closed-form physics, an independent method, or energy conservation — RCWA vs. transfer-matrix to 1e-6, multilayer S-matrix to 1e-15, 2D#sym.arrow.r 1D degenerate reduction to 5e-12, summed diffraction efficiency 1.000000. Independently cross-validated against the grcwa and Stanford S#super[4] solvers to #sym.approx#h(0.1em)1e-7 and reproduces canonical published metalenses (Khorasaninejad et al., _Science_ 2016; Chen et al., _Nat. Nanotechnol._ 2018).
#v(-0.35em)
- Gradient-based (Adam) inverse design over meta-atom parameter sweeps; Monte-Carlo fabrication-tolerance analysis; Strehl, Zernike wavefront, MTF and chromatic-focal-shift analysis battery.
#v(-0.35em)
- Accelerated Rayleigh–Sommerfeld far-field propagation as a CUDA kernel, benchmarked against the project's own optimized 16-core CPU path: 4.8–5.8#sym.times at 92k pillars, agreeing to machine precision. Diagnosed the kernel as memory-bound from the speedup's decline with grid size. C++23/CUDA with Python bindings. _Sole-author manuscript in preparation (Computer Physics Communications)._

#v(-0.2em)
#grid(
  columns: (1fr, auto),
  [*Undergraduate Researcher* — #link("https://creol.ucf.edu/astrophotonics/")[#text(fill: lc)[#underline[UCF Astrophotonics Lab]]], CREOL], [August 2025 – Present]
)
#v(-0.6em)
#grid(columns: (1fr,), [_Supervisor: Dr. Stephen Eikenberry_])
#v(-0.4em)
- Measuring the wavelength-dependent complex transfer matrix of a photonic lantern by off-axis digital holography: align the interferometric bench and acquire holograms of the multimode output for each input port across the C-band (1525–1575 nm), recovering full amplitude and phase.
#v(-0.35em)
- Implemented the #link("https://github.com/jeebuscrossaint/digital-holography-automation")[#text(fill: lc)[#underline[phase-retrieval and mode-decomposition analysis]]]: FFT sideband isolation and demodulation, Butterworth low-pass, joint numerical optimization of mode-field diameter, defocus quadratic phase and field position, then decomposition onto the LP basis. Produced the per-port reconstruction-fidelity characterization for 6- and 7-port lanterns at #sym.approx#h(0.1em)98% fidelity against simulated fields.
#v(-0.35em)
- Automated the four-instrument acquisition chain (HP 8168E tunable IR laser, Xenics Bobcat 320 InGaAs camera, DiCon GP700 fiber switch, Thorlabs MPC320 polarization control) over GPIB/VISA, RS-232 and GigE Vision, so a complete all-port #sym.times C-band sweep runs unattended with in-loop polarization optimization and saturated-frame rejection — reducing a full dataset from days of manual bench time to a single hands-off run.
#v(-0.35em)
- Contribute mount control and pointing automation to #link("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[#text(fill: lc)[#underline[PolyOculus]]], an instrument program building photometric capability from a networked array of 8 telescopes.

#v(-0.2em)
#grid(
  columns: (1fr, auto),
  [*Undergraduate Research Assistant* — UCF Physics Department], [March 2026 – Present]
)
#v(-0.6em)
#grid(columns: (1fr,), [_Physics Education Research — Dr. Zhongzhou Chen (funded by NSF Award 2421299; Gates Foundation INV-076932)_])
#v(-0.4em)
- Built #link("https://github.com/jeebuscrossaint/estela")[#text(fill: lc)[#underline[ESTELA]]], generating multi-version isomorphic exams from a structured bank of 615 problems across 29 banks, 13 topic areas and 11 question types, with auto-generated answer keys and export to four formats. Rust (Tauri 2). Materials in use by external adopters; manuscript in preparation.

#v(-0.2em)
#grid(
  columns: (1fr, auto),
  [*Undergraduate Researcher* — #link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: lc)[#underline[FAU Grant-Funded AI Safety Research Project]]]], [January 2024 – March 2025]
)
#v(-0.6em)
#grid(columns: (1fr,), [_Supervisor: Tucker Hindle, Florida Atlantic University_])
#v(-0.4em)
- Benchmarked 10 statistical coherence and detection measures (GPT-2 perplexity, RoBERTa, BERT NSP, LSA, NLI, burstiness) on a 255,000-passage corpus; identified GPT-2 perplexity as the strongest discriminator (3.35#sym.times separation, 17.5 vs. 58.5) and showed BERT NSP to be uninformative.
#v(-0.35em)
- Built four adversarial evasion pipelines (iterative rewriting, tree-search decoding, list-branching, RL) over 3,125 generated sequences; characterized a consistent quality–evasion tradeoff. Grant-funded with HPC access; presented at the Wilkes Honors College Symposium.

#v(-0.5em)
#text(size: 10.5pt, weight: "bold")[CONFERENCE ABSTRACTS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#v(-0.5em)
#grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  [*Sub-diffraction imaging and precision wavefront sensing with photonic lanterns* — co-author. Abstract submitted to SPIE Photonics West 2027, OPTO: Photonic Instrumentation Engineering XIV. _Under review._], [2027],
)
#v(-0.5em)

#text(size: 10.5pt, weight: "bold")[TECHNICAL SKILLS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
*Numerical & Statistical Methods:* FFT and signal processing, phase retrieval, modal decomposition, electromagnetic simulation (RCWA), gradient-based optimization, Monte-Carlo tolerance analysis, statistical discriminator benchmarking, GPU/CUDA acceleration \
#v(-0.6em)
*Programming:* C/C++ (C++23), CUDA, Rust, Python (NumPy, SciPy), VHDL, Shell (Fish, Bash) \
#v(-0.6em)
*Tools:* Linux, Git, CMake, Docker, Qt/PySide6, LaTeX/Typst; GPIB/VISA, RS-232, GigE Vision instrument control

#text(size: 10.5pt, weight: "bold")[HONORS & AWARDS]
#v(-1em)
#line(length: 100%, stroke: 0.4pt)
#grid(
  columns: (1fr, auto),
  row-gutter: 0.5em,
  [Barry M. Goldwater Scholarship — UCF institutional nominee], [2026],
  [Astronaut Scholarship Foundation — UCF institutional nominee], [2026],
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
  [1st Place, Night Hacks Hackathon — UniUtils (course schedule generator & classroom finder)], [2023],
)
