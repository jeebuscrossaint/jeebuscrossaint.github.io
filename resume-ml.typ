#import "resume-style.typ": *
#show: resume.with(
  size: 9.3pt,
  leading: 0.48em,
  tagline: [Empirical LLM evaluation, adversarial robustness, and applied AI systems — with the GPU and numerics background under it.],
)

#sect[EDUCATION]
#school(
  [University of Central Florida], [Undergraduate Student], [4.00 GPA],
  [B.S. Physics (Optics & Lasers) and Mathematics, Computer Science minor],
  [August 2025 – Expected May 2029],
)
- *Machine learning and computing:* Deep Learning, Data Structures & Algorithms, Computer Architecture, Object-Oriented Programming, Discrete Structures
- *Mathematics:* Linear Algebra (proof-based, in progress), Complex Analysis, Partial Differential Equations (in progress), Applied Linear Algebra, Ordinary Differential Equations, Mathematical Methods for Physics
#school(
  [Florida Atlantic University], [University coursework via FAU High School, ages 14–18], [3.66 GPA],
  [111 credit hours completed between ages 14 and 18, alongside high school],
  [August 2021 – May 2025],
)

#sect[RESEARCH EXPERIENCE]

#entry(
  [*Undergraduate Researcher* — #lnk("https://github.com/inconspicuous-buisness-venture/chameleon-testing")[FAU Grant-Funded AI Safety Research Project]],
  [January 2024 – March 2025],
)
#sub[Supervisor: Tucker Hindle, Florida Atlantic University]
- Evaluated whether AI-text detection actually works, and what it costs to defeat it. Benchmarked 10 statistical coherence and detection measures — GPT-2 perplexity, RoBERTa classification, BERT next-sentence prediction, latent semantic analysis, NLI entailment, burstiness — on a 255,000-passage corpus of human and model-generated text.
- Established GPT-2 perplexity as the strongest discriminator (3.35#sym.times separation, 17.5 versus 58.5), RoBERTa as the only effective trained detector, and BERT NSP as carrying no usable signal for the task — a negative result worth having.
- Built four adversarial evasion pipelines against those detectors: iterative paraphrase-and-recheck, coherence- and perplexity-based tree-search decoding, list-branching, and a reinforcement-learning approach — over 3,125 generated sequences from Gemini 2.0 Flash, Gemini 1.5 Pro and GPT-4o. Characterized a consistent quality–evasion tradeoff: every method that reliably beat the detector degraded the text.
- Grant-funded with HPC access. #lnk("https://apatel.co/ai-safety.pdf")[Technical report]; presented at the Wilkes Honors College Undergraduate Research Symposium, 2025.

#entry(
  [*Undergraduate Research Assistant* — UCF Physics Department],
  [March 2026 – Present],
)
#sub[Physics Education Research — Dr. Zhongzhou Chen (NSF Award 2421299; Gates Foundation INV-076932)]
- Built an agentic generation–evaluation pipeline that drafts candidate physics problems and validates them against instructor criteria before human review, running at scale over the Azure OpenAI batch API. Presented the batch-processing approach to automated grading at UCF, June 2026.
- Built #lnk("https://github.com/jeebuscrossaint/estela")[ESTELA] (Rust, Tauri 2), the assessment tool the pipeline feeds: multi-version isomorphic exams from a structured bank of 615 problems across 29 banks, 13 topic areas and 11 question types, with export to four formats. In use by external adopters outside the university; manuscript in preparation.

#entry(
  [*Undergraduate Researcher* — #lnk("https://creol.ucf.edu/astrophotonics/")[UCF Astrophotonics Lab], CREOL],
  [August 2025 – Present],
)
#sub[Supervisor: Dr. Stephen Eikenberry]
- Inference on noisy experimental data: FFT demodulation, filtering, and joint nonlinear optimization over three coupled parameters to recover complex amplitude and phase from raw interferograms, validated at #sym.approx#h(0.1em)98% fidelity against simulated ground truth (NumPy/SciPy).
- Built the acquisition system that produces the data — four instruments driven as one experiment, with in-loop objective optimization and automatic bad-frame rejection, turning days of manual collection into a single unattended run.

#sect[SELECTED PROJECTS]
#entry(
  [*#lnk("https://github.com/jeebuscrossaint/CELERIS")[CELERIS]* — GPU-accelerated numerical solver. C++23, CUDA, Python],
  [2026],
)
- Wrote a Maxwell solver and design pipeline from scratch, including a CUDA kernel benchmarked at 4.8–5.8#sym.times over the project's own optimized 16-core CPU path at 92k elements and diagnosed as memory-bound from the way the speedup declined with problem size. Gradient-based (Adam) optimization over high-dimensional design parameters; Monte-Carlo tolerance analysis. _Sole-author manuscript in preparation._
#entry([*#lnk("https://github.com/jeebuscrossaint/narvi-demo-maker-llm")[Narvi]* — agentic workflow that designs and builds interactive STEM demos in real time for non-coding end users], [2026])

#sect[TECHNICAL SKILLS]
*Machine learning:* empirical evaluation and benchmarking methodology, adversarial robustness, LLM inference and prompting at scale (Azure OpenAI batch API), agentic pipelines, transformer-based classification, perplexity and coherence metrics, reinforcement learning, tree-search decoding \
#v(-0.55em)
*Numerical and systems:* CUDA kernel development and profiling, HPC cluster work, linear algebra, FFT and signal processing, gradient-based optimization, Monte-Carlo methods \
#v(-0.55em)
*Languages and tools:* Python (NumPy, SciPy), C++ (C++23), CUDA, Rust, C, Go; Linux, Git, CMake, Docker, LaTeX/Typst

#sect[HONORS]
#dated(
  [Florida Bright Futures — Florida Academic Scholars (highest tier; 100% tuition)], [2025],
  [Lockheed Martin Award, "Highest Level of Engineering Excellence," AEV Competition], [2024],
  [1st Place, Night Hacks Hackathon — UniUtils], [2023],
)
