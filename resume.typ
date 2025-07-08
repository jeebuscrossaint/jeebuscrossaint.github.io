#set page(margin: (x: 0.8in, y: 0.8in))
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true)

// Header
#align(center)[
  #text(size: 14pt, weight: "bold")[AMARNATH S. PATEL]
  #v(0.2em)
  #text(size: 11pt)[
     #link("mailto:apatel6ty@protonmail.com")[#text(fill: blue)[#underline[apatel6ty\@protonmail.com]]] | #link("https://jeebuscrossaint.github.io/")[#text(fill: blue)[#underline[jeebuscrossaint.github.io]]]
  ]
]

#v(0.3em)
#line(length: 100%, stroke: 0.5pt)
#v(0.2em)

// Education Section
#text(size: 11pt, weight: "bold")[EDUCATION]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Florida Atlantic University*], [*3.65 GPA*]
)
#grid(
  columns: (1fr, auto),
  [Computer Science coursework - High School Diploma], [August 2021 - May 2025]
)

#v(0.1em)
- Embedded Systems, UNIX & UNIX likes, Web Development, AI/LLMS, interest in OS dev & quantum computing
- Relevant Coursework: Data Structures and Algorithms, Computer Logic Design, Matrix Theory, C & C++ programming, Deep Learning, Computer Architecture

#v(0.25em)

// Skills Section
#text(size: 11pt, weight: "bold")[SKILLS]
#v(0.1em)

*Programming:* C/C++, Nix, Rust, Zig, Go, JavaScript, HTML/CSS, Shell (Fish Bash tcsh)

*Tools:* NeoVim, Docker, Git, AI-LLMs, Rustup, CMake, Nix, Zig

*Operating Systems:* Linux Distributions, BSD, Windows, Proxmox, OpenSolaris

#v(0.25em)

// Professional Experience Section
#text(size: 11pt, weight: "bold")[PROFESSIONAL EXPERIENCE]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*Learning Assistant - Employee*], [August 2024 - May 2025]
)
- Assisted numerous undergraduate students with learning calculus. Part-time job (10h a week).

#v(0.2em)

#grid(
  columns: (1fr, auto),
  [*Advanced Experimental Vehicles - Programmer, Leader, Builder*], [November 2023 - May 2025]
)
- Raspberry Pi 5 used as an embedded device in making a full Electron app to monitor and control a built-from-scratch solar car. Esque to your car's screen + speedometer
- Won 2nd Place in Division, and Lockheed Martin Award for "Highest Level of Engineering Excellence"

#v(0.2em)

#grid(
  columns: (1fr, auto),
  [*FAU High-School Coding Club - Leader*], [August 2023 - May 2025]
)
- Founded a High School's coding club, providing leadership experience, along with management.
- Building a robotic dog, similar to Boston Dynamics robotics, weather stations, and drones.

#v(0.2em)

#grid(
  columns: (1fr, auto),
  [*Chameleon - Programmer - HPC User*], [January 2024 - March 2025]
)
- Building an AI/LLM powered research project for writing, grant funded by Florida Atlantic University. The university provided us access to their own HPC to train models upon (user).

#v(0.25em)

// Projects Section
#text(size: 11pt, weight: "bold")[PROJECTS]
#v(0.1em)

#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/YamanDevelopment/UniUtils")[#text(fill: blue)[#underline[UniUtils]]]*], [October 2023 - November 2024]
)
- Tool for students to generate a schedule for their semester based on multiple parameters, along with an ability for students to find classrooms on campus to study and get work done in.
- 1st Place in the Night Hacks 2023 hackathon & submitted in ShellHacks, JS HTML CSS

#v(0.2em)

#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/limebar")[#text(fill: blue)[#underline[limebar]]]*], [December 2024 - March 2025]
)
- A Wayland graphical status bar that takes input directly from STDIN. Uses pango for font rendering and cairo for graphics along with xdg-shell-client protocol and wlr-layer-shell-unstable.

#v(0.2em)

#grid(
  columns: (1fr, auto),
  [*#link("https://github.com/jeebuscrossaint/aocli")[#text(fill: blue)[#underline[aocli]]]*], [December 2023 - ad infinitum]
)
- My Advent of Code solutions, including a custom written C++ CLI tool to let me retrieve puzzle inputs, view problems, and submit answers from the terminal, available publicly for download. Uses libcurl for web requests and gumbo-parser by Google for converting html to plaintext.