#import "resume-style.typ": *
#show: resume.with(
  size: 9.4pt,
  leading: 0.48em,
  tagline: [Physics and mathematics undergraduate — numerical methods, statistical inference, and performance-critical C++/CUDA.],
)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
- *Mathematics:* Linear Algebra (proof-based, in progress), Complex Analysis, Partial Differential Equations (in progress), Applied Linear Algebra, Ordinary Differential Equations, Mathematical Methods for Physics, Discrete Structures, Honors Calculus III
- *Computing:* Data Structures & Algorithms, Computer Architecture, Computer Logic Design, Object-Oriented Programming, Deep Learning
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school],
  [August 2021 – May 2025],
)

#sect[QUANTITATIVE RESEARCH EXPERIENCE]

#entry(
  [*Independent Research* — #lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]: high-performance numerical solver. C++23, CUDA, Python],
  [2026],
)
- Wrote a numerical solver for Maxwell's equations in periodic structures from scratch: Fourier-basis eigenvalue problems per layer, dense complex linear algebra, and a numerically stable scattering-matrix recursion chosen over the transfer-matrix formulation precisely because the latter loses conditioning as layers accumulate.
- Held the whole stack to measurable error bounds rather than eyeballed agreement — 1e-6 against an independent method, 1e-15 on multilayer recursion, 5e-12 on a degenerate-case reduction, unitarity to 1.000000 — and cross-validated the finished solver against two third-party implementations to #sym.approx#h(0.1em)1e-7.
- Gradient-based (Adam) optimization over high-dimensional design parameters, plus Monte-Carlo tolerance analysis quantifying how performance degrades under manufacturing noise.
- Wrote the hot path as a CUDA kernel and benchmarked it against the project's own optimized 16-core CPU implementation: 4.8–5.8#sym.times at 92k elements, agreeing to machine precision. Read the speedup's decline with problem size as evidence the kernel was memory-bound rather than compute-bound. _Sole-author manuscript in preparation._

#entry(
  [*#lnk("https://stardust.apatel.co")[Stardust]* — finding faint moving objects in noisy archival images. PyTorch, CUDA],
  [October 2026],
)
- Built the inference pipeline: sample the uncertainty of a 4-day orbit with 100,000 GPU-propagated clones, project it onto years of archival survey images, and score candidate detections with a U-Net and a classic matched filter, accepting only tracks consistent with one orbit across nights.
- Ran it like an out-of-sample test: rules developed on 22 asteroids, then frozen and run once on 50 held out (16 recovered). Detector thresholds matched to a common false-alarm rate and committed before rerunning; each track given a formal chance probability against measured junk density and decoy stacks (17 of 22 at 5σ). Result: 167 never-connected sightings, orbits up to 52× tighter.

#entry(
  [*Undergraduate Researcher* — #lnk("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[FAU Grant-Funded AI Safety Research Project]],
  [January 2024 – March 2025],
)
#sub[Supervisor: Tucker Hindle, Florida Atlantic University]
- Ran a signal-versus-noise study on a 255,000-passage corpus: benchmarked 10 candidate statistical discriminators (perplexity, transformer classifiers, latent semantic analysis, natural-language inference, burstiness) and ranked them by separation power. GPT-2 perplexity won at 3.35#sym.times separation (17.5 versus 58.5); BERT next-sentence prediction turned out to carry no signal at all, which was worth establishing.
- Built four adversarial strategies against those discriminators — iterative rewriting, tree-search decoding, list-branching and reinforcement learning — over 3,125 generated sequences, and characterized a consistent tradeoff between evasion success and output quality. Grant-funded with HPC access.

#entry(
  [*Undergraduate Researcher* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [August 2025 – Present],
)
#sub[Supervisor: Dr. Stephen Eikenberry]
- Estimation and signal processing on noisy experimental data: FFT sideband isolation and demodulation, Butterworth filtering, and a joint nonlinear optimization over three coupled parameters to recover complex amplitude and phase from raw interferograms — #sym.approx#h(0.1em)98% fidelity against simulated ground truth.
- Automated the four-instrument acquisition chain end to end, with in-loop optimization of a live objective and automatic rejection of bad frames, turning days of manual data collection into a single unattended run.
- Own the node software for the lab's 8-telescope PolyOculus array: feedback control from a camera to mount guide pulses that cuts simulated tracking error tenfold (3.01″ #sym.arrow.r 0.29″ RMS), on Jetson Nanos I brought up on mainline Linux.

#sect[PROGRAMMING]
- *Systems, in C, Rust and Go:* #lnk("https://github.com/jeebuscrossaint/hush")[hush], an interactive shell in C; #lnk("https://github.com/jeebuscrossaint/limebar")[limebar], a Wayland status bar in C; #lnk("https://github.com/jeebuscrossaint/constrict")[constrict], a build system in Go written to replace make; #lnk("https://github.com/jeebuscrossaint/hazmat")[hazmat], a password manager in C99.

#sect[SKILLS]
*Mathematics and methods:* linear algebra and eigenvalue problems, complex analysis, differential equations, Fourier analysis, numerical optimization, Monte-Carlo methods, statistical benchmarking and discriminator evaluation, error analysis \
#v(-0.55em)
*Programming:* C++ (C++23), Python (NumPy, SciPy), C, CUDA, Rust, Go; Linux, Git, CMake, GPU profiling

#sect[HONORS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
)
