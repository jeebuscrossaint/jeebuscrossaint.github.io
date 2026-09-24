#import "resume-style.typ": *
#show: resume.with(size: 9.6pt, ymargin: 0.5in, leading: 0.5em, orcid: true)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school],
  [August 2021 – May 2025],
)

#sect[RESEARCH EXPERIENCE]

#entry(
  [*Undergraduate Researcher* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [August 2025 – Present],
)
#sub[Supervisor: Dr. Stephen Eikenberry]
- Measuring the wavelength-dependent complex transfer matrix of a photonic lantern by off-axis digital holography, extending Dobias et al., _Opt. Express_ *34*(9), 17217 (2026). A photonic lantern couples a multimode fiber to an array of single-mode fibers; using one to feed starlight into single-mode photonic devices requires knowing exactly how light entering each port emerges from the multimode end, in amplitude and phase, at every wavelength of interest.
- Align the interferometric bench and acquire holograms of the multimode output for each input port across the C-band (1525–1575 nm), recovering full amplitude and phase — one row of the transfer matrix per measurement.
- Implemented the phase-retrieval and mode-decomposition analysis: FFT sideband isolation and demodulation, Butterworth low-pass filtering, joint numerical optimization of mode-field diameter, defocus quadratic phase and field position, then decomposition onto the LP basis to recover complex modal amplitude and phase.
- Produced the per-port reconstruction-fidelity characterization for 6- and 7-port lanterns, reaching #sym.approx#h(0.1em)98% fidelity $|⟨E_"rec", E_"sim"⟩|^2$ against simulated fields.
- #lnk("https://github.com/jeebuscrossaint/digital-holography-automation")[Automated the four-instrument acquisition chain] — tunable laser, InGaAs camera, fiber switch and motorized polarization control — so a complete all-port × C-band sweep runs unattended, with polarization optimized in-loop for peak fringe contrast and saturated frames rejected on arrival. A full dataset went from days of manual bench time to a single hands-off run.
- Contribute mount control and pointing automation to #lnk("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[PolyOculus], an instrument program building photometric observing capability from a networked array of 8 telescopes, aimed at a redshift-drift measurement.

#entry(
  [*Independent Research* — #lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]: computational electromagnetics and metalens design],
  [2026],
)
- Built a from-scratch solver for Maxwell's equations in periodic subwavelength structures via rigorous coupled-wave analysis / the Fourier modal method: 1D TE/TM multilayer gratings with Li and Liu–Fan inverse-rule factorization, the full 2D-vectorial $P dot Q$ formulation for biperiodic nanopillar arrays, and stable Redheffer scattering-matrix layer recursion.
- Validated every layer of the stack against closed-form physics, an independent method, or energy conservation: RCWA versus the transfer-matrix method to 1e-6, multilayer S-matrix to 1e-15, 2D#sym.arrow.r 1D degenerate reduction to 5e-12, $Sigma$(diffraction efficiency) = 1.000000, and diffraction-limited designed focal spots at FWHM = $lambda f \/ D$. Independently cross-validated against the grcwa and Stanford S#super[4] solvers (#sym.approx#h(0.1em)1e-7) and reproduces canonical published metalenses (Khorasaninejad et al., _Science_ 2016; Chen et al., _Nat. Nanotechnol._ 2018).
- Implemented the physical design and analysis capability standalone RCWA kernels lack: Sellmeier and tabulated $n,k$ dispersion, meta-atom library sweeps with automatic etch-depth selection for full-2#sym.pi phase coverage, gradient-based (Adam) inverse design, and Pancharatnam–Berry geometric-phase and polarization-multiplexed lenses exploiting form birefringence. Analysis covers Strehl ratio, Zernike wavefront, MTF, chromatic focal shift, through-focus caustic and fabrication-tolerance Monte Carlo, with fabrication-ready GDSII export.
- Accelerated Rayleigh–Sommerfeld far-field propagation as a CUDA kernel, benchmarked against the project's own optimized 16-core CPU path: 4.8–5.8#sym.times at 92k pillars, agreeing to machine precision. C++23/CUDA with Python bindings. _Sole-author manuscript in preparation (Computer Physics Communications)._

#entry(
  [*Undergraduate Research Assistant* — UCF Physics Department],
  [March 2026 – Present],
)
#sub[Physics Education Research — Dr. Zhongzhou Chen (NSF Award 2421299; Gates Foundation INV-076932)]
- Research on automated assessment generation for introductory physics instruction: built #lnk("https://github.com/jeebuscrossaint/estela")[ESTELA], which produces multi-version isomorphic exams from a structured bank of 615 problems across 29 banks, 13 topic areas and 11 question types, and an agentic generation–evaluation pipeline that iteratively drafts and validates new problems against instructor criteria.
- Materials authored for the project are in use by external adopters following a faculty workshop. Manuscript in preparation.

#entry(
  [*Undergraduate Researcher* — #lnk("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[FAU Grant-Funded AI Safety Research Project]],
  [January 2024 – March 2025],
)
#sub[Supervisor: Tucker Hindle, Florida Atlantic University]
- Benchmarked 10 statistical coherence and detection measures (GPT-2 perplexity, RoBERTa, BERT next-sentence prediction, LSA, NLI, burstiness) on a 255,000-passage corpus; identified GPT-2 perplexity as the strongest discriminator (3.35#sym.times separation, 17.5 versus 58.5) and showed BERT NSP to be uninformative for the task.
- Built four adversarial evasion pipelines (iterative rewriting, tree-search decoding, list-branching, reinforcement learning) over 3,125 generated sequences and characterized a consistent quality–evasion tradeoff. Grant-funded with HPC access.

#sect[PRESENTATIONS]
#entry([*Batch Processing for Automated Grading via Azure OpenAI*], [June 2026])
University of Central Florida, Downtown Campus. ESTELA project, Physics Education Research.

#entry([*Coherence and Detection Approaches for Identifying AI-Generated Text*], [March 2025])
Wilkes Honors College Undergraduate Research Symposium, Florida Atlantic University.

#sect[TECHNICAL REPORTS]
#entry(
  [*#lnk("https://apatel.co/ai-safety.pdf")[Coherence and Detection Approaches for Identifying AI-Generated Text]*],
  [2025],
)
Empirical study of AI-text detection and adversarial evasion: benchmarked 10 coherence and detection methods and built four evasion pipelines, characterizing a consistent quality–evasion tradeoff. Grant-funded, Florida Atlantic University.

#sect[TECHNICAL SKILLS]
*Instrumentation:* interferometric alignment, GPIB/VISA and RS-232 instrument control, INDI, GigE Vision camera acquisition, tunable IR laser control, motorized polarization control, fiber coupling, FITS and GDSII data formats \
#v(-0.55em)
*Scientific computing:* FFT and signal processing, phase retrieval and modal decomposition, electromagnetic simulation (RCWA), gradient-based optimization, Monte-Carlo tolerance analysis, GPU/CUDA acceleration, NumPy, SciPy \
#v(-0.55em)
*Programming:* C/C++ (C++23), CUDA, Python, Rust, Go, shell (Fish, Bash), LaTeX/Typst \
#v(-0.55em)
*Tools:* Linux, Git, CMake, Docker, Qt/PySide6

#sect[RELEVANT COURSEWORK]
*University of Central Florida* — _Physics:_ Geometric Optics & Lab, Modern Physics, Quantum Information Processing, Mathematical Methods for Physics, Independent Research \[PHY 4912\], Electricity & Magnetism I (in progress). _Mathematics:_ Applied Linear Algebra, Complex Analysis, Linear Algebra (proof-based, in progress), Partial Differential Equations (in progress). _Computer science:_ C Programming, Discrete Structures, Object-Oriented Programming. \
#v(-0.55em)
*Florida Atlantic University* — General Physics I and II (honors), Calculus I–III (honors), Ordinary Differential Equations, Elementary Matrix Algebra, Data Structures & Algorithms, Computer Architecture, Computer Logic Design, Deep Learning, #box[C++ Programming].

#sect[HONORS & AWARDS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
  [2nd Place in Division, Advanced Experimental Vehicles Competition], [2024],
  [1st Place, Night Hacks Hackathon — UniUtils], [2023],
)

#sect[SERVICE & OUTREACH]
#dated(
  [Secretary, National Society of Black Physicists — UCF chapter], [2025 – Present],
  [Teaching Assistant, Calculus — office hours, exam review and grading for 70 undergraduates], [2024 – 2025],
  [Founder and President, Coding Club, FAU High School — now an official Hack Club chapter], [2023 – 2025],
)
