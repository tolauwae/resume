// Profile

#let profile = (
  title: "Tom Lauwaerts",
  honorific: "Dr.",
  email: "tom.lauwaerts@gmail.com",
  phone: "(+32) 468 20 27 42",
  linkedin: "tolauwae",
  homepage: "https://tolauwae.github.io/",
  github: "tolauwae",
  specialism: "Postdoctoral researcher passionate about programming language design and debuggers."
)

#let languages = (
  (name: "Dutch", proficiency: "Native"),
  (name: "English", proficiency: "High proficiency"),
  (name: "French", proficiency: "Elementary"),
  (name: "Chinese", proficiency: "Novice"),
)

// Experience and education

#let education = (
  (
    head: "PhD in Computer Science",
    quiet: "2021 - 2025",
    description: [Ghent University, TOPL Lab],
    oneline: true,
  ),
  (
    head: "BSc. and MSc. in Computer Science",
    quiet: "2016 - 2021",
    description: [Ghent University, Faculty of Sciences],
    oneline: true,
  ),
)

#let work-experience = (
  (
    employer: "Vrije Universiteit Brussel",
    role: "Post-doctoral Researcher",
    start: 2025,
    end: "present",
    description: "",
  ),
  (
    employer: "Ghent University",
    role: "PhD Researcher: Programming Languages",
    start: 2021,
    end: 2025,
    description: "Research into debugging and testing tools with a strong formal foundation.",
  ),
  (
    employer: "Ghent University",
    role: "Teaching Assistant",
    start: 2021,
    end: 2025,
    description: [Courses: _Fundamenten van programmeertalen_, _Logisch programmeren_.],
  ),
  (
    employer: "Creative Therapy (startup)",
    role: "Embedded Software Developer (Internship)",
    start: "July",
    end: "August 2020",
    description: "",
  ),
)

// Former entries retained as content notes:
// - Creative Therapy: Researching WebUSB technology and developing a USB gadget
//   driver in Linux for WebUSB communication between the online platform and the
//   hardware.
// - Digipolis, Software Developer, 2017 - 2018: Student job over two summers,
//   designing Linked Open Data chatbots and assessing decentralized blockchain
//   technology for parking in Ghent.

// Service and honors

#let volunteer-work = (
  (
    head: "Science communication and outreach",
    quiet: "2021 - present",
    description: "Alumniday UGent, Dag van de Wetenschap, Comp Sci Olympiad ...",
    oneline: true,
  ),
  (
    head: "Open-source software contributor",
    quiet: "2021 - present",
    description: none,
    projects: (
      (name: "WARDuino", github: "TOPLLab/WARDuino"),
      (name: "latch", github: "TOPLLab/latch"),
      (name: "personal projects", github: "tolauwae"),
    ),
    oneline: true,
  ),
)

// Former volunteer entry: Member of the OCI and delegate to the CKO (UGent),
// 2022 - 2025. Delegated member to the CKO since September 2024 and member of
// the focus group for the computer science bachelor and master program reforms.
// Possible future open-source entry: typst/typst.

#let academic-services = (
  (
    head: "ICOOOLPS workshop co-organizer",
    quiet: "2026 - 2027",
    description: "Co-organizing the ICOOOLPS'26 and ICOOOLPS'27 workshops.",
    oneline: true,
    url: "https://2026.ecoop.org/home/ICOOOLPS-2026",
  ),
  (
    head: "ECOOP student volunteer chair and local organizer",
    quiet: "2026",
    description: "Part of the VUB team organizing ECOOP'26 in Brussels.",
    oneline: true,
    url: "https://2026.ecoop.org",
  ),
  (
    head: "DEBT workshop co-organizer",
    quiet: "2025",
    description: "Co-organizing the DEBT'25 workshop.",
    oneline: true,
    url: "https://2025.ecoop.org/home/debt-2025",
  ),
  (
    head: "Programming artifact evaluation committee member",
    quiet: "2024 - 2027",
    description: "AEC member for the Programming conference and journal (vol. 9 to 12).",
    oneline: true,
    url: "https://2025.programming-conference.org/track/programming-2025-artifacts",
  ),
)

// Other research-activity notes:
// - Active collaboration: Open Bot Brain, 2023 - present, with Francisco Ferreira
//   Ruiz (Royal Holloway).
// - Research stay at Kent University, September 2022, collaborating with Stefan Marr.
// - OPLSS 2022 Summer School, June - July 2022.

#let honors = (
  (
    head: "ISSTA'23 Research competition: 3rd place",
    quiet: "2023",
    description: "ACM Student Research Competition at ECOOP/ISSTA 2023 3rd place medal.",
    oneline: true,
    url: "https://2023.issta.org/track/ecoop-issta-2023-student-research-competition",
  ),
)

// Research output

#let research-profiles = (
  orcid: "0000-0003-1262-8893",
  researchgate: "Tom-Lauwaerts",
  google-scholar: "https://scholar.google.com/citations?user=uHdt08sAAAAJ&hl=en&oi=ao",
)

// Kept for the standalone Conference talks & demonstrations section, which is
// currently not rendered.
#let presentations = (
  // todo complete list
  (
    head: "Event-Based Out-of-Place Debugging",
    venue: "MPLR'22",
    description: [],
    doi: "https://doi.org/10.1145/3546918.3546920",
    slide: "https://tolauwae.github.io/mplr22/",
  ),
)

// TODO: Add the full list of conference talks, collaborations, and summer school.

#let publications = (
  (
    head: "Concolic Multiverse Debugging",
    date: "2026-06",
    authors: ("Maarten Steevens", "Tom Lauwaerts", "Christophe Scholliers"),
    venue: "Special Issue of the 40th European Conference on Object-Oriented Programming (ECOOP 2026)",
    type: "full paper",
    description: [An early version of this work was presented by myself at the final of the ISSTA'23 Research competition.],
    artifact: "https://doi.org/10.4230/DARTS.12.1.11",
  ), (
  head: "MIO: Multiverse Debugging in the Face of Input/Output",
  date: "2025-10",
  authors: ("Tom Lauwaerts", "Maarten Steevens", "Christophe Scholliers"),
  venue: "Proceedings of the ACM on Programming Languages (PACMPL), Volume 9, Issue OOPSLA2",
  type: "full paper",
  description: [Presented this work at the main track of the OOPSLA 2025 conference.],
  doi: "https://doi.org/10.4230/LIPIcs.ECOOP.2026.27",
  repo: "https://github.com/TOPLLab/MIO",
  artifact: "https://doi.org/10.5281/zenodo.15838624",
  slide: "https://tolauwae.github.io/oopsla25/",
),
  (
    head: "Foundations for Constrained Debugging Techniques",
    date: "2025-08",
    authors: ("Tom Lauwaerts",),
    venue: "PhD dissertation (Universiteit Gent)",
    type: "dissertation",
    description: [],
    doi: "http://hdl.handle.net/1854/LU-01KFB658STR3F7MV4VQ552DC2F",
    repo: "https://github.com/tolauwae/phd-thesis",
  ),
  (
    head: "Latch: Enabling large-scale automated testing on constrained systems",
    date: "2024-12",
    authors: ("Tom Lauwaerts", "Stefan Marr", "Christophe Scholliers"),
    venue: "Science of Computer Programming Journal",
    type: "journal paper",
    description: [Presented this work during a poster session at the ISSTA'23 conference.],
    doi: "https://doi.org/10.1016/j.scico.2024.103157",
    repo: "https://github.com/TOPLLab/latch",
  ),
  (
    head: "Concolic Multiverse Debugging",
    date: "2024-09",
    authors: ("Maarten Steevens", "Tom Lauwaerts", "Christophe Scholliers"),
    venue: "2nd ACM International Workshop on Future Debugging Techniques (DEBT 2024)",
    type: "demo",
    description: [],
    doi: "https://doi.org/10.1145/3678720.3685318",
  ),
  (
    head: "WARDuino: An embedded WebAssembly virtual machine",
    date: "2024-06",
    authors: ("Tom Lauwaerts", "Robbert Gurdeep Singh", "Christophe Scholliers"),
    venue: "Journal of Computer Languages",
    type: "journal paper",
    description: [Presented at the International Conference on the Art, Science, and Engineering of Programming 2022, during a poster session and a dedicated demonstration.],
    doi: "https://doi.org/10.1016/j.cola.2024.101268",
    repo: "https://github.com/TOPLLab/WARDuino/",
    docs: "https://topllab.github.io/WARDuino/",
  ),
  (
    head: "Out-of-Place Debugging on Constraint Devices with the EDWARD Debugger (Demo)",
    date: "2023-07",
    authors: ("Tom Lauwaerts", "Carlos Rojas Castillo", "Elisa Gonzalez Boix", "Christophe Scholliers"),
    venue: "DEBT'23",
    type: "demo",
    description: [Demo presentation at the first Workshop on Future Debugging Techniques (DEBT'23).],
    doi: "https://doi.org/10.1145/3605155.3605862",
    slide: "https://tolauwae.github.io/debt.demo/",
  ),
  (
    head: "Demo: Debugging Constraint Devices with EDWARD",
    date: "2023-06",
    authors: ("Tom Lauwaerts", "Carlos Rojas Castillo", "Elisa Gonzalez Boix", "Christophe Scholliers"),
    venue: "MobiSys'23",
    type: "demo",
    description: [Demo and poster presentation at the 21st ACM International Conference on Mobile Systems, Applications, and Services (MobiSys'23).],
    doi: "https://doi.org/10.1145/3581791.3597293",
  ),
  (
    head: "Event-Based Out-of-Place Debugging",
    date: "2022-09",
    authors: ("Tom Lauwaerts", "Carlos Rojas Castillo", "Robbert Gurdeep Singh", "Matteo Marra", "Christophe Scholliers", "Elisa Gonzalez Boix"),
    venue: "MPLR'22",
    type: "full paper",
    description: [Presented this work at the main track of the 19th International Conference on Managed Programming Languages & Runtimes (MPLR'22).],
    doi: "https://doi.org/10.1145/3546918.3546920",
    docs: "https://topllab.github.io/WARDuino/reference/edward/",
    slide: "https://tolauwae.github.io/mplr22/",
  ),
)
