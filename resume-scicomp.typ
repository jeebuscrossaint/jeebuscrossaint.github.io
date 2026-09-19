#import "resume-style.typ": *
#show: resume.with(
  size: 9pt,
  leading: 0.48em,
  orcid: true,
  tagline: [Scientific software — numerical methods, GPU acceleration, and verification you can actually check.],
)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
- *Mathematics:* Linear Algebra (proof-based, in progress), Complex Analysis, Partial Differential Equations (in progress), Applied Linear Algebra, Ordinary Differential Equations, Mathematical Methods for Physics
- *Computing:* Data Structures & Algorithms, Computer Architecture, Computer Logic Design, Object-Oriented Programming, Discrete Structures, Deep Learning
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school],
  [August 2021 – May 2025],
)

#sect[SCIENTIFIC SOFTWARE]

#entry(
  [*#lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]* — electromagnetic solver and metasurface design pipeline. C++23, CUDA, Python, CMake],
  [2026],
)
- Wrote a full rigorous coupled-wave analysis solver from scratch rather than wrapping an existing kernel: per-layer Fourier-basis eigenproblems, dense complex linear algebra, Li and Liu–Fan inverse-rule factorization, the 2D-vectorial $P dot Q$ formulation for biperiodic structures, and a Redheffer scattering-matrix recursion chosen over the transfer-matrix form for numerical stability across many layers.
- Treated verification as a first-class feature: every layer is checked against closed-form physics, an independent method, or energy conservation — 1e-6 against the transfer-matrix method, 1e-15 on multilayer recursion, 5e-12 on a degenerate-case reduction, $Sigma$(diffraction efficiency) = 1.000000 — and the assembled solver is cross-validated against the grcwa and Stanford S#super[4] codes to #sym.approx#h(0.1em)1e-7, reproducing canonical published results (Khorasaninejad et al., _Science_ 2016; Chen et al., _Nat. Nanotechnol._ 2018).
- Implemented Rayleigh–Sommerfeld far-field propagation as a CUDA kernel and benchmarked it honestly — against the project's own optimized 16-core CPU path, not against a naive baseline: 4.8–5.8#sym.times at 92k elements, agreeing to machine precision, with automatic CPU fallback. Diagnosed the kernel as memory-bound rather than compute-bound from the way the speedup declined as the grid grew.
- Built the science on top of the kernel: material dispersion (Sellmeier and tabulated $n,k$), parameter sweeps, gradient-based (Adam) inverse design, Monte-Carlo tolerance analysis, a wavefront/MTF/Strehl analysis battery, and GDSII export. Python bindings and a native Qt desktop GUI over the C++ core. _Sole-author manuscript in preparation (Computer Physics Communications)._

#entry(
  [*Undergraduate Researcher* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [August 2025 – Present],
)
#sub[Supervisor: Dr. Stephen Eikenberry]
- Built the lab's #lnk("https://github.com/jeebuscrossaint/digital-holography-automation")[data-acquisition system]: a Python stack that drives four instruments as one coordinated experiment across GPIB/VISA, RS-232 and GigE Vision, with in-loop optimization of a live objective and automatic rejection of saturated frames. Reduced a full measurement campaign from days of manual operation to a single unattended run.
- Implemented the reduction pipeline that turns raw interferograms into physics: FFT sideband isolation and demodulation, Butterworth filtering, joint nonlinear optimization over three coupled parameters, and decomposition onto an analytic mode basis (NumPy/SciPy). Characterized at #sym.approx#h(0.1em)98% reconstruction fidelity against simulated ground truth.
- Contribute mount control and pointing automation to #lnk("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[PolyOculus], coordinating a networked array of 8 telescopes as one instrument.

#entry(
  [*Undergraduate Research Assistant* — UCF Physics Department],
  [March 2026 – Present],
)
#sub[Physics Education Research — Dr. Zhongzhou Chen (NSF Award 2421299; Gates Foundation INV-076932)]
- Built #lnk("https://github.com/jeebuscrossaint/estela")[ESTELA] (Rust, Tauri 2), a research tool generating multi-version isomorphic exams from a structured bank of 615 problems across 29 banks, 13 topic areas and 11 question types, with export to four formats. In production use by external adopters outside the university; manuscript in preparation.
- Built an agentic generation–evaluation pipeline over the Azure OpenAI batch API that drafts and validates candidate problems against instructor criteria.

#entry([*Other software*], [2023 – Present])
- Systems and tooling in C, Rust and Go: #lnk("https://github.com/jeebuscrossaint/hush")[hush], an interactive shell in C; #lnk("https://github.com/jeebuscrossaint/limebar")[limebar], a Wayland status bar in C; #lnk("https://github.com/jeebuscrossaint/constrict")[constrict], a build system in Go written to replace make; #lnk("https://github.com/jeebuscrossaint/coat")[coat], a universal theme applier in Rust.
- Embedded Linux platform (Arch Linux ARM on a Raspberry Pi 5, gpsd, USB serial, WireGuard) behind live worldwide telemetry for a #lnk("https://github.com/YamanDevelopment/AEV-Software")[four-passenger solar car] — 2nd in division, Lockheed Martin Award for engineering excellence.

#sect[TECHNICAL SKILLS]
*Numerical methods:* dense and complex linear algebra, eigenvalue problems, FFT and signal processing, gradient-based optimization, Monte-Carlo methods, phase retrieval and modal decomposition, error analysis and convergence testing \
#v(-0.55em)
*High performance:* CUDA kernel development and profiling, multicore CPU optimization, memory-bound versus compute-bound analysis, HPC cluster work \
#v(-0.55em)
*Languages and tools:* C++ (C++23), CUDA, C, Python (NumPy, SciPy), Rust, Go; Linux, Git, CMake, Docker, Qt/PySide6, LaTeX/Typst; GPIB/VISA, RS-232, GigE Vision, FITS, GDSII

#sect[HONORS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
  [1st Place, Night Hacks Hackathon — UniUtils], [2023],
)
