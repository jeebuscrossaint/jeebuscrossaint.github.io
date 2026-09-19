#import "resume-style.typ": *
#show: resume.with(
  size: 9pt,
  leading: 0.48em,
  orcid: true,
  tagline: [Optical engineering — interferometric benches, fiber and laser instrumentation, metasurface design and tolerancing.],
)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
- *Optics and physics:* Geometric Optics & Lab, Modern Physics, Quantum Information Processing, Mathematical Methods for Physics, Electricity & Magnetism I (in progress), Independent Research \[PHY 4912\]
- Optics coursework through CREOL, UCF#sym.quote.r.single#h(0em)s College of Optics and Photonics.
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school],
  [August 2021 – May 2025],
)

#sect[OPTICS EXPERIENCE]

#entry(
  [*Undergraduate Researcher* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [August 2025 – Present],
)
#sub[Supervisor: Dr. Stephen Eikenberry]
- Align and operate an off-axis digital holography bench to measure the wavelength-dependent complex transfer matrix of photonic lanterns — the amplitude and phase relationship between each single-mode input port and the multimode output — across the C-band, 1525–1575 nm, extending Dobias et al., _Opt. Express_ *34*(9), 17217 (2026).
- Hands-on with the full optical chain: interferometer alignment and fringe optimization, fiber coupling and switching, tunable IR source control, InGaAs imaging, and motorized polarization control. Instruments include an HP 8168E tunable laser, a Xenics Bobcat 320 InGaAs camera, a DiCon GP700 fiber switch and a Thorlabs MPC320 polarization controller.
- Implemented the phase-retrieval and mode-decomposition analysis: FFT sideband isolation and demodulation, Butterworth low-pass filtering, joint optimization of mode-field diameter, defocus quadratic phase and field position, then LP-basis decomposition for complex modal amplitude and phase.
- Delivered the per-port reconstruction-fidelity characterization for 6- and 7-port lanterns at #sym.approx#h(0.1em)98% fidelity against simulated fields — the metrology result the group's measurement campaign rests on.
- #lnk("https://github.com/jeebuscrossaint/digital-holography-automation")[Automated the four-instrument acquisition chain] over GPIB/VISA, RS-232 and GigE Vision so a complete all-port × C-band sweep runs unattended, with polarization optimized in-loop for peak fringe contrast and saturated frames rejected on arrival. A full dataset went from days of bench time to a single hands-off run.
- Contribute mount control and pointing automation to #lnk("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[PolyOculus], an instrument program building large-aperture observing capability from a networked array of 8 telescopes fed by photonic linkage to a stabilized spectrograph.

#entry(
  [*Independent Research* — #lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]: metasurface design and analysis pipeline],
  [2026],
)
- Built a rigorous coupled-wave analysis solver from scratch (1D TE/TM gratings with Li and Liu–Fan inverse-rule factorization, full 2D-vectorial formulation for biperiodic nanopillar arrays, Redheffer scattering-matrix recursion) and the complete metalens design pipeline on top of it.
- Optical design and analysis: Sellmeier and tabulated $n,k$ dispersion, meta-atom library sweeps with automatic etch-depth selection for full-2#sym.pi phase coverage, gradient-based inverse design, and Pancharatnam–Berry geometric-phase and polarization-multiplexed lenses exploiting form birefringence, reported as per-polarization RMS phase and focal isolation in dB.
- Performance evaluated the way an optical system is: Strehl ratio, Zernike wavefront decomposition, MTF, chromatic focal shift, through-focus caustic, and Monte-Carlo fabrication-tolerance analysis — with fabrication-ready GDSII export at the end of it.
- Validated against closed-form physics, an independent method and energy conservation (1e-6 to 1e-15), cross-checked against the grcwa and Stanford S#super[4] solvers (#sym.approx#h(0.1em)1e-7), and reproduces canonical published metalenses (Khorasaninejad et al., _Science_ 2016; Chen et al., _Nat. Nanotechnol._ 2018). Diffraction-limited designed focal spots at FWHM = $lambda f \/ D$. _Sole-author manuscript in preparation._

#sect[PRESENTATIONS]
#entry([*Complex Transfer-Matrix Characterization of a Photonic Lantern by Off-Axis Digital Holography*], [Nov 2026])
Joint Annual Conference of the National Society of Black Physicists and the National Society of Hispanic Physicists, North Carolina. _Upcoming._

#sect[TECHNICAL SKILLS]
*Optics and metrology:* interferometric alignment, off-axis digital holography, phase retrieval, modal decomposition, wavefront analysis (Strehl, Zernike, MTF), fiber coupling and photonic lanterns, polarization control, diffractive and metasurface design, tolerance analysis \
#v(-0.55em)
*Instrumentation:* GPIB/VISA and RS-232 instrument control, GigE Vision camera acquisition, INDI, tunable IR lasers, InGaAs imaging, motorized stages and polarization controllers, FITS and GDSII \
#v(-0.55em)
*Computation:* electromagnetic simulation (RCWA/FMM), FFT and signal processing, gradient-based optimization, Monte-Carlo methods, GPU/CUDA acceleration; C/C++ (C++23), CUDA, Python (NumPy, SciPy), Rust; Linux, Git, CMake, Qt/PySide6

#sect[HONORS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
)
