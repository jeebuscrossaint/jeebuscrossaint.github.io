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
    #link("https://github.com/jeebuscrossaint")[#text(fill: lc)[#underline[github.com/jeebuscrossaint]]] |
    #link("https://orcid.org/0009-0008-9460-082X")[#text(fill: lc)[#underline[ORCID 0009-0008-9460-082X]]]
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
  [B.S. in Physics (Optics & Lasers) and Mathematics, Computer Science Minor (43 credit hours)], [August 2025 – Present]
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
- Measuring the wavelength-dependent complex transfer matrix of a photonic lantern by #link("https://github.com/jeebuscrossaint/digital-holography-automation")[#text(fill: lc)[#underline[off-axis digital holography]]], extending Dobias et al., _Opt. Express_ *34*(9), 17217 (2026). Align the interferometric bench and acquire holograms of the multimode output for each input port across the C-band (1525–1575 nm), recovering full amplitude and phase — one row of the transfer matrix per measurement.
- Implemented the phase-retrieval and mode-decomposition analysis: FFT sideband isolation and demodulation, Butterworth low-pass, joint numerical optimization of mode-field diameter, defocus quadratic phase and field position, then decomposition onto the LP basis to recover complex modal amplitude and phase.
- Produced the per-port reconstruction-fidelity characterization for 6- and 7-port lanterns, reaching #sym.approx#h(0.1em)98% fidelity $|⟨E_"rec", E_"sim"⟩|^2$ against simulated fields.
- Automated the four-instrument acquisition chain — tunable laser, InGaAs camera, fiber switch, and motorized polarization control — so a complete all-port × C-band sweep runs unattended, with polarization optimized in-loop for peak fringe contrast and saturated frames rejected, reducing a full dataset from days of manual bench time to a single hands-off run.
- Contribute mount control and pointing automation to #link("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[#text(fill: lc)[#underline[PolyOculus]]], an astronomical instrument program building photometric observing capability from a networked array of 8 telescopes.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*UCF Physics Department — Undergraduate Research Assistant*], [March 2026 – Present]
)
#grid(columns: (1fr,), [_Physics Education Research — Dr. Zhongzhou Chen (NSF Award 2421299; Gates Foundation INV-076932)_])
- Research on automated assessment generation for introductory physics instruction: built #link("https://github.com/jeebuscrossaint/estela")[#text(fill: lc)[#underline[ESTELA]]], a system producing multi-version isomorphic exams from structured problem banks, and an agentic generation–evaluation pipeline that iteratively drafts and validates new problems against instructor criteria.
- Materials authored for the project are in use by external adopters following a faculty workshop. Manuscript in preparation.

#v(0.15em)
#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[#text(fill: lc)[#underline[FAU Grant-Funded AI Safety Research Project]]] (High School)*], [January 2024 – March 2025]
)
#grid(columns: (1fr,), [_Supervisor: Tucker Hindle, Florida Atlantic University_])
- Benchmarked 10+ coherence and detection methods (GPT-2 perplexity, RoBERTa, BERT NSP, LSA, NLI, burstiness) across 3,125+ generated sequences; identified GPT-2 perplexity as the strongest discriminator (3.3× separation between coherent and incoherent text).
- Characterized a consistent quality–evasion tradeoff across four adversarial humanization pipelines. Grant-funded with HPC access; presented at the Wilkes Honors College Symposium (2025).

/* ── OTHER EXPERIENCE ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[OTHER EXPERIENCE]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Secretary — National Society of Black Physicists (NSBP), UCF Chapter*], [2025 – Present]
)
- Coordinate meetings, records, and communications for the UCF student chapter of the National Society of Black Physicists.

#v(0.15em)
#block(breakable: false)[
#grid(
  columns: (1fr, auto),
  [*President — Coding Club, Florida Atlantic University (High School)*], [2023 – 2025]
)
- Founded and led a student coding club; organized meetings and collaborative programming projects with peers.
]

#v(0.15em)
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

/* ── CONFERENCE PROCEEDINGS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[CONFERENCE ABSTRACTS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  [*Sub-diffraction imaging and precision wavefront sensing with photonic lanterns*], [2027]
)
Co-author. Abstract submitted to SPIE Photonics West 2027, OPTO — Photonic Instrumentation Engineering XIV (OE206), San Francisco, CA, 30 January – 4 February 2027. _Under review._

/* ── PRESENTATIONS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[PRESENTATIONS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  [*Complex Transfer-Matrix Characterization of a Photonic Lantern by Off-Axis Digital Holography*], [November 2026 (upcoming)]
)
Joint Annual Conference of the National Society of Black Physicists and the National Society of Hispanic Physicists, North Carolina.

#v(0.15em)
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
  [*#link("https://github.com/jeebuscrossaint/CELERIS")[#text(fill: lc)[#underline[CELERIS]]] — Metalens Design Pipeline & From-Scratch RCWA Solver*], [2026]
)
- From-scratch solver for Maxwell's equations in periodic subwavelength structures via rigorous coupled-wave analysis / the Fourier modal method: 1D TE/TM multilayer gratings with Li/Liu–Fan inverse-rule factorization, full 2D-vectorial $P dot Q$ formulation for biperiodic nanopillar arrays, and stable Redheffer scattering-matrix layer recursion.
- Validated every layer of the stack against closed-form physics, an independent method, or energy conservation: RCWA vs. transfer-matrix method to 1e-6, multilayer S-matrix to 1e-15, 2D→1D degenerate reduction to 5e-12, $Sigma$(diffraction efficiency) = 1.000000, and diffraction-limited designed focal spots at FWHM = $lambda f \/ D$. Independently cross-validated against the grcwa and Stanford S#super[4] solvers (#sym.approx#h(0.1em)1e-7) and reproduces canonical published metalenses (Khorasaninejad et al., _Science_ 2016; Chen et al., _Nat. Nanotechnol._ 2018).
- Implemented the physical design and analysis capability standalone RCWA kernels lack: Sellmeier and tabulated $n,k$ dispersion, meta-atom library sweeps with automatic etch-depth selection for full-2#sym.pi phase coverage, gradient-based (Adam) inverse design, Pancharatnam–Berry geometric-phase and polarization-multiplexed lenses exploiting form birefringence (reporting per-polarization RMS phase and focal isolation in dB), plus Strehl, Zernike wavefront, MTF, chromatic focal shift, through-focus caustic, and fabrication-tolerance Monte-Carlo analysis with fabrication-ready GDSII export.
- Accelerated Rayleigh–Sommerfeld far-field propagation as a CUDA kernel, benchmarked against the project's own optimized 16-core CPU path: 4.8–5.8#sym.times at 92k pillars, agreeing to machine precision, with automatic CPU fallback. Diagnosed the kernel as memory-bound from the speedup's decline with grid size. C++23/CUDA, with Python bindings and a native desktop GUI. _Sole-author manuscript in preparation (Computer Physics Communications)._

/* ── SKILLS ── */
#v(0.2em)
#line(length: 100%, stroke: 0.3pt)
#v(0.1em)
#text(size: 11pt, weight: "bold")[TECHNICAL SKILLS]
#v(0.1em)

*Instrumentation:* GPIB/VISA, RS-232, INDI, GigE Vision camera acquisition, tunable IR laser control, motorized polarization control, interferometric alignment, FITS & GDSII data formats

*Scientific Computing:* FFT & signal processing, phase retrieval & modal decomposition, electromagnetic simulation (RCWA), GPU/CUDA acceleration, NumPy, SciPy

*Programming Languages:* C/C++, CUDA, Python, Shell (Fish, Bash, tcsh), LaTeX/Typst

*Tools:* Linux, Git, CMake, Qt/PySide6

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
  [Independent Research \[PHY 4912\]],           [Electricity & Magnetism I (In Progress)],
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
  [Object-Oriented Programming],               [],
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
  [1st Place, Night Hacks Hackathon — UniUtils (course schedule generator & classroom finder)], [2023]
)
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
  [Barry M. Goldwater Scholarship — UCF institutional nominee], [2026]
)
#grid(
  columns: (1fr, auto),
  [Astronaut Scholarship Foundation — UCF institutional nominee], [2026]
)
