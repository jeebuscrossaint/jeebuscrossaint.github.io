#import "resume-style.typ": *
#show: resume.with(
  size: 9.1pt,
  tagline: [Systems and scientific software — C++23/CUDA, Rust, Python. Hardware to GPU kernels to shipped desktop apps.],
)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
- *Computer science:* Data Structures & Algorithms, Computer Architecture, Computer Logic Design, Object-Oriented Programming, Discrete Structures, C Programming, Deep Learning
- *Mathematics:* Linear Algebra (proof-based, in progress), Complex Analysis, Partial Differential Equations (in progress), Applied Linear Algebra, Ordinary Differential Equations, Honors Calculus III
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school], [August 2021 – May 2025],
)

#sect[EXPERIENCE]

#entry(
  [*Undergraduate Researcher, Instrumentation Software* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [Aug 2025 – Present],
)
- Own the lab's #lnk("https://github.com/jeebuscrossaint/digital-holography-automation")[acquisition software]: a Python stack that drives four instruments as one system — tunable IR laser, InGaAs camera, fiber switch and motorized polarization controller — across three transports (GPIB/VISA, RS-232, GigE Vision), so a full all-port × C-band measurement sweep runs unattended. Days of manual bench operation became a single hands-off run.
- Closed-loop control and fault handling in the acquisition path: polarization optimized in-loop against a live fringe-contrast objective, saturated frames detected and rejected as they arrive, so an overnight run does not silently produce unusable data.
- Built the numerical pipeline that turns raw frames into results — FFT sideband isolation and demodulation, Butterworth filtering, and a joint nonlinear optimization over three coupled parameters (NumPy/SciPy) — validated at #sym.approx#h(0.1em)98% reconstruction fidelity against simulated ground truth.
- Contribute mount control and pointing automation (INDI) to #lnk("https://creol.ucf.edu/astrophotonics/creol-astrophotonics-polyoculus/")[PolyOculus], an instrument program coordinating a networked array of 8 telescopes.

#entry(
  [*Undergraduate Research Assistant* — UCF Physics Department],
  [Mar 2026 – Present],
)
#sub[Physics Education Research — Dr. Zhongzhou Chen (NSF Award 2421299; Gates Foundation INV-076932)]
- Built #lnk("https://github.com/jeebuscrossaint/estela")[ESTELA] (Rust, Tauri 2), a desktop application that generates multi-version isomorphic exams from a structured bank of 615 problems across 29 banks, 13 topic areas and 11 question types, with auto-generated answer keys and export to four formats. Shipped to external adopters outside the university following a faculty workshop.
- Built an agentic generation–evaluation pipeline over the Azure OpenAI batch API that drafts candidate problems and validates them against instructor criteria before a human ever reviews them.

#entry(
  [*Programmer, Coding Subteam* — #lnk("https://github.com/YamanDevelopment/AEV-Software")[Advanced Experimental Vehicles], Florida Atlantic University],
  [Nov 2023 – May 2025],
)
- Owned the Unix and systems half of a four-person software team building live telemetry for a four-passenger solar car: Arch Linux ARM on a Raspberry Pi 5, a Hyprland compositor session driving the in-car touchscreen, gpsd and USB-serial plumbing to the GPS and Thunderstruck BMS, and the WireGuard tunnel that made worldwide remote monitoring possible at all.
- The dashboard those services fed (team stack: Nuxt.js, Tailwind, Electron and Three.js over an Express + WebSocket backend) ran in the car and streamed to the pit crew and to viewers off-site simultaneously, through four days of racing. 2nd in the Cruiser Division; Lockheed Martin Award for engineering excellence.

#sect[SELECTED SOFTWARE]

#entry([*#lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]* — electromagnetic solver and metalens design pipeline. C++23, CUDA, Python, CMake], [2026])
- Wrote a Maxwell solver from scratch rather than wrapping an existing kernel, then built the design and analysis tooling on top: parameter sweeps, gradient-based (Adam) inverse design, Monte-Carlo tolerance analysis, and fabrication-ready GDSII export. Python bindings and a native Qt desktop GUI.
- Correctness is enforced, not assumed: a validation suite checks every layer against closed-form solutions, an independent method, or energy conservation (agreement from 1e-6 to 1e-15), and cross-checks the whole solver against two third-party implementations to #sym.approx#h(0.1em)1e-7.
- Implemented Rayleigh–Sommerfeld propagation as a CUDA kernel and benchmarked it against the project's own optimized 16-core CPU path: 4.8–5.8#sym.times at 92k elements, agreeing to machine precision, with automatic CPU fallback. Diagnosed the kernel as memory-bound rather than compute-bound from the way the speedup declined as the grid grew. _Sole-author manuscript in preparation._

#entry([*Systems and tooling* — C, C++, Rust, Go], [2023 – Present])
- #lnk("https://github.com/jeebuscrossaint/hush")[hush], an interactive shell in C; #lnk("https://github.com/jeebuscrossaint/limebar")[limebar], a featherweight Wayland status bar in C; #lnk("https://github.com/jeebuscrossaint/constrict")[constrict], a build system in Go written to replace make; #lnk("https://github.com/jeebuscrossaint/coat")[coat], a universal theme applier in Rust; #lnk("https://github.com/jeebuscrossaint/hazmat")[hazmat], a small password manager in C99. Tools I use daily on my own machine, not demos.
- #lnk("https://github.com/jeebuscrossaint/slashbinslash.sh")[slashbinslash.sh], temporary file sharing and storage; #lnk("https://apatel.co")[apatel.co], a hand-written static site with no framework, no build step and no third-party requests at runtime; UniUtils, a course-schedule generator and classroom finder — 1st place, Night Hacks hackathon.

#sect[TECHNICAL SKILLS]
*Languages:* C, C++ (C++23), Rust, Python, Go, JavaScript/TypeScript, CUDA, VHDL, Shell (Fish, Bash) \
#v(-0.55em)
*Frameworks and libraries:* Qt/PySide6, Tauri 2, Nuxt/Vue, Express, Electron, Three.js, NumPy, SciPy \
#v(-0.55em)
*Systems and tools:* Linux (Arch, daily driver), Git, CMake, Docker, WireGuard, Wayland, embedded Linux on Raspberry Pi, GPU/CUDA profiling, GPIB/VISA, RS-232, GigE Vision, LaTeX/Typst

#sect[HONORS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
  [1st Place, Night Hacks Hackathon — UniUtils], [2023],
)
