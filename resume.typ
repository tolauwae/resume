// Colour scheme

#let highlight = rgb(0, 88, 66) // (77, 91, 75)

// #2A2D31 Jet
// #6F5392 Royal Purple
// #2C446F Dark Cornflower Blue
// #6C7F93 Slate Gray
// #799ACC Blue Gray
// #468F92 Viridian Green
// #B2D1C9 Opal
// #005842 Castleton Green

#let subdued = rgb("#526b65")

#let smaller(it) = text(size: 8pt, it)

#let dividor = [
    #v(1.0em)
    #line(
      length: 100%,
      stroke: (paint: rgb("#8fa39f"), thickness: 0.45pt),
    )
]

// Styling

#set line(stroke: black)

//#show link: set text(fill: subdued, style: "italic");

#show heading.where(level: 1): set text(fill: highlight)
#show heading.where(level: 2): set text(fill: highlight)
#show heading.where(level: 3): set text(fill: highlight)

// Socials

#let social(url, icon, body) = [
    #show link: set text(weight: 500)
    #link(url, grid(columns: 2, align: alignment.horizon, column-gutter: 3pt, [
    #set text(fill: highlight)
    #image(icon, width: 1em, height: 1em)
  ], body))
]

#let linkedin(id, color: rgb(0,0,0)) = { 
    social("https://linkedin.com/in/" + id, "icons/linkedin.svg", "")
}

#let github(id, color: rgb(0,0,0)) = {
    social("https://github.com/" + id, "icons/github.svg", "")
}

#let homepage(id, color: rgb(0,0,0)) = {
    social(id, "icons/homepage.svg", "")
}

#let mail(id, color: rgb(0,0,0)) = {
    social("mailto:" + id, "icons/mail.svg", id)
}

#let phone(number, color: rgb(0, 0, 0)) = [
    #grid(columns: 2, align: alignment.horizon, column-gutter: 3pt, image("icons/phone.svg", width: 1em, height: 1em), number)
]

#let researchgate(id, color: rgb(0,0,0)) = {
    social("https://researchgate.net/profile/" + id, "icons/researchgate.svg", "")
}

#let googlescholar(id, color: rgb(0,0,0)) = {
    social(id, "icons/google-scholar.svg", "")
}

#let orcid(id, color: rgb(0,0,0), full: false) = {
    social("https://orcid.org/" + id, "icons/orcid.svg", [#if full [#id] else []])
}

#let opensource(project, url) = {
  let content = (github(url), project)
  set text(fill: highlight, weight: "bold", size: 8pt)
  link(url, grid(columns: 4, align: alignment.horizon, column-gutter: 1pt, ..content))
}

// Building blocks

#let item(head, quiet, description, oneline: false, url: none, doi: none, repo: none, artifact: none, docs: none, slide: none) = [
    #let emphasize(addendum: [], url: none, body) = [
        #block(above: 1.2em, below: 0.7em)[
            #let content = ()
            #if url != none {
                content.push(image("icons/link.svg", height: 0.9em))
            }
            #if oneline {
                content.push([#text(weight: 700)[#body] #text(fill: subdued, style: "italic")[#sym.dot.op #addendum]])
            } else {
                content.push([#text(weight: 700)[#body]])
            }
            #if doi != none {
            content.push([
                #link(doi, image("icons/pdf.svg", height: 1em))
            ])}
            #if repo != none {content.push([
                #link(repo, image("icons/git.svg", height: 1em))
            ])}
            #if artifact != none {content.push([
                #link(artifact, image("icons/artifact.svg", height: 0.9em))
            ])}
            #if slide != none {content.push([
                #link(slide, image("icons/slideshow.svg", height: 1em))
            ])}
            #if docs != none {
            content.push([
                #link(docs, image("icons/docs.svg", height: 1em))])
            }
            #grid(columns: 5, align: alignment.horizon, column-gutter: 3pt, ..content)
        ]
    ]

    #show heading: set block(below: 0.7em)

    #let content = [
        #if oneline [
            #emphasize(addendum: quiet, url: url, head)
        ] else [
            #emphasize(url: url, head)
            #text(fill: subdued, style: "italic", quiet)
        ]

        #if description != "" [
            #v(0.1em)
            #description
        ]
    ]
        #if url != none [
            #link(url, content)
        ] else [
            #content
        ]
]

#let experience(employer, role, start, end, description, duration: none, oneline: false) = [
    #show heading: set block(below: 0.7em)

    #item(role,     [
        #if employer.len() > 0 [
            #employer #sym.dot.op *#start - #end* #if duration != none [(#duration)]
        ] else [
            #start - #end
        ] \
    ], description, oneline: oneline)
]

// Styling

#set text(font: ("Lato"), size: 10pt)

#show heading.where(level: 2): it => {
    set block(below: 0.5em, above: 1.0em)
    it
    line(length: 100%, stroke: 0.5pt)
    v(0.5em)
}

// Content

#let title = [
        #show heading: set block(below: 0.4em)
        #show heading: set text(font: "Lusitana", weight: 700, size: 1.9em, spacing: 0.2em)
        #set par(leading: 0.2em)

        #heading[#text(fill: subdued, size: 18pt, style: "italic")[dr.] Tom Lauwaerts]
]

// Page

#let sidemargin = 6em

#let columns = (4fr, 11fr)

#set page(margin: (left: sidemargin, right: sidemargin, top: 4em, bottom: 4em), paper: "a4")

#let contact = [
    //#v(0.3em)
    #text(size: 8pt)[
        #set text(fill: subdued)
        #grid(columns: 5, gutter: 5pt, align: alignment.horizon,
            link("mailto:tom.lauwaerts@gmail.com", "tom.lauwaerts@gmail.com"),
            sym.dot.op,
            "(+32) 468 20 27 42",
            sym.dot.op,
        [
            #set text(size: 10pt)
            #grid(columns: 4, column-gutter: 3pt, align: alignment.horizon,
                linkedin("tolauwae"),
                homepage("https://tolauwae.github.io/"),
                github("tolauwae"))
        ]
        )
    ]
]

#let lan = text(size: 8pt)[
        #set text(fill: subdued)
        #grid(columns: 7, gutter: 5pt, align: alignment.horizon,
            [*Dutch* Native], sym.dot.op, [*English* High proficiency], sym.dot.op, [*French* Elementary], sym.dot.op, [*Chinese* Novice]
        )
    ]


#[
    #block(
        width: 100%,
        fill: rgb("#e8f2ef"),
        inset: (top: 0pt, bottom: 0.6cm),
        outset: (x: sidemargin, top: sidemargin),
    )[
        #set align(center)
        #title
        #contact
        #lan
    ]
]

#let languages = [

#grid(columns: columns, [
    === Languages
], [
    #grid(columns: 3, column-gutter: 1em,
    item("Dutch", "Native", [], oneline: true),
    item("English", "High proficiency", [], oneline: true),
    item("French", "Elementary", [], oneline: true))
])
]

#let education = [
#grid(columns: columns, [
    === Education // Opleiding
], [
        #item("PhD in Computer Science", "2021 - 2025", [Ghent University, TOPL Lab], oneline: true)

    #item("BSc. and MSc. in Computer Science", "2016 - 2021", [Ghent University, Faculty of Sciences], oneline: true)
])
]



#grid(columns: columns, [
    === Work experience
], [
    #experience("Vrije Universiteit Brussel", "Post-doctoral Researcher", 2025, "present", "")

    #experience("Ghent University", "PhD Researcher: Programming Languages", 2021, 2025, "Research into debugging and testing tools with a strong formal foundation.", duration: "4 years")

    #experience("Ghent University",  "Teaching Assistant", 2021, 2025,
        [Courses: #text(style: "italic", "Fundamenten van programmeertalen"), #text(style: "italic", "Logisch programmeren").], duration: "4 years")

    #experience("Creative Therapy (startup)", "Embedded Software Developer (Internship)", "July", "August 2020", "") //, "Researching WebUSB technology and developing a USB gadget driver in Linux for WebUSB communication between the online platform and the hardware.")

    //#experience("Digipolis", "Software Developer", 2017, 2018, [Student job over two summers: 
    //    - Designing and developing chatbots using Linked Open Data for the #text(style: "italic", "Gentse Feesten"), for the city council of Ghent, and for tourism Ghent.
    //    - Assessing the viability of decentralized blockchain technology for parking in Ghent using a digital "parking coin".
    //])
])

#dividor
#education

#let services = [
#dividor
#grid(columns: columns, [
    === Volunteer work
], [
    // #item( "Member of the OCI and delegate to the CKO (UGent)", "2022 - 2025", "Delegated member to the CKO since sept 2024, and currently part of the focus group for the computer science bachelor and master program reforms.", oneline: true)

    #item( "Science communication and outreach", "2021 - present", "Alumniday UGent, Dag van de Wetenschap, Comp Sci Olympiad ...", oneline: true)

    #item( "Open-source software contributor", "2021 - present", grid(columns: 5, column-gutter: 5pt, opensource("WARDuino", "TOPLLab/WARDuino"), sym.dot.op, opensource("latch", "TOPLLab/latch"), sym.dot.op, opensource("personal projects", "tolauwae")), oneline: true) // opensource("typst", "typst/typst")
])
]

#let miopaper = item("MIO: Multiverse Debugging in the Face of Input/Output", [2025-10 | *Tom Lauwaerts*, Maarten Steevens, Christophe Scholliers | Proceedings of the ACM on Programming Languages (PACMPL), Volume 9, Issue OOPSLA2], [I presented this work at the main track of the OOPSLA 2025 conference.], doi: "https://doi.org/10.1145/3763136", repo: "https://github.com/TOPLLab/MIO", artifact: "https://doi.org/10.5281/zenodo.15838624", slide: "https://tolauwae.github.io/oopsla25/")

#let research-highlight = [

#dividor

#grid(columns: columns, [
    === Highlighted research \ output
    
    #smaller(grid(columns: 3, column-gutter: 3pt, orcid("0000-0003-1262-8893"), researchgate("Tom-Lauwaerts"), googlescholar("https://scholar.google.com/citations?user=uHdt08sAAAAJ&hl=en&oi=ao")))

], [#miopaper])
]

#let presentations = [
#dividor
#grid(columns: columns, [
    === Conference talks & \ demonstrations
], [
    #item("Latch: Enabling large-scale automated testing on constrained systems", "2024-12 | Science of Computer Programming Journal", [], doi: "https://doi.org/10.1016/j.scico.2024.103157", repo: "https://github.com/TOPLLab/latch")

    #item("WARDuino: An embedded WebAssembly virtual machine", "2024-06 | Journal of Computer Languages", [], doi: "https://doi.org/10.1016/j.cola.2024.101268", repo: "https://github.com/TOPLLab/WARDuino/", docs: "https://topllab.github.io/WARDuino/")

    #item("Event-Based Out-of-Place Debugging", "MPLR'22", [], doi: "https://doi.org/10.1145/3546918.3546920", slide: "https://tolauwae.github.io/mplr22/")

    #item("Event-Based Out-of-Place Debugging", "MPLR'22", [], doi: "https://doi.org/10.1145/3546918.3546920", slide: "https://tolauwae.github.io/mplr22/")

])
]
#research-highlight

#let international = [

#dividor

#grid(columns: columns, [
    //=== Collaborations & \ international experience
    === Academic services
    //=== International collaborations & \ other research activities
], [
    #item("ICOOOLPS workshop co-organizer", "2026 - 2027", "Co-organizing the ICOOOLPS'26 and ICOOOLPS'27 workshops.", oneline: true, url: "https://2026.ecoop.org/home/ICOOOLPS-2026")

    #item("ECOOP student volunteer chair and local organizer", "2026", "Part of the VUB team organizing ECOOP'26 in Brussels.", oneline: true, url: "https://2026.ecoop.org")

    #item("DEBT workshop co-organizer", "2025", "Co-organizing the DEBT'25 workshop.", oneline: true, url: "https://2025.ecoop.org/home/debt-2025")

    #item("Programming artifact evaluation committee member", "2024 - 2027", "AEC member for the Programming conference and journal (vol. 9, 10, 11, 12).", oneline: true, url: "https://2025.programming-conference.org/track/programming-2025-artifacts")

    //#item( "Active collaboration: Open Bot Brain", "2023 - present", "Research project with Francisco Ferreira Ruiz (Royal Holloway).", oneline: true)

    //#item( "Research stay: Kent University", "Sept 2022", "Research collaboration with Stefan Marr (Kent University).", oneline: true)

    //#item("OPLSS 2022 Summer school", "June - July 2022", "Attended the Oregon Programming Languages Summer School.", oneline: true, url: "https://www.cs.uoregon.edu/research/summerschool/summer22/")

])
]
#international

#let honors = [

#dividor

#grid(columns: columns, [
    === Honors
], [
    #item( "ISSTA'23 Research competition: 3rd place", "2023", "International ACM Research competition at ECOOP/ISSTA 2023 3rd place medal.", oneline: true, url: "https://2023.issta.org/track/ecoop-issta-2023-student-research-competition")
])
]

#services

#honors

// Appendix

    #heading(level: 2, grid(columns: 4, column-gutter: 3pt, align: alignment.horizon, "Scientific publications", smaller(orcid("0-000-000-000-000")), smaller(researchgate("Tom-Lauwaerts")), smaller(googlescholar("https://scholar.google.com/citations?user=uHdt08sAAAAJ&hl=en&oi=ao"))))

// todo add full list of authors, and put own name in bold

// todo full list: conference talks + collaborations + summer school

    //#item("OPLSS Summer school", "July 2021", "", oneline: true)
    #item("Concolic Multiverse Debugging", [2026-06 | Maarten Steevens, *Tom Lauwaerts*, Christophe Scholliers | Special Issue of the 40th European Conference on Object-Oriented Programming (ECOOP 2026)], [An early version of this work was presented by myself at the final of the ISSTA'23 Research competition.], doi: "https://doi.org/10.1145/3678720.3685318", artifact: "https://doi.org/10.4230/DARTS.12.1.11")
    #v(1em)

    #miopaper
    #v(1em)

    #item("Foundations for Constrained Debugging Techniques", [2025-08 | *Tom Lauwaerts* | PhD dissertation (Universiteit Gent)], [], doi: "https://doi.org/10.1145/3763136", repo: "https://github.com/tolauwae/phd-thesis")
    #v(1em)

    #item("Latch: Enabling large-scale automated testing on constrained systems", [2024-12 | *Tom Lauwaerts*, Stefan Marr, Christophe Scholliers | Science of Computer Programming Journal], [I presented this work during a poster session at the ISSTA'23 conference.], doi: "https://doi.org/10.1016/j.scico.2024.103157", repo: "https://github.com/TOPLLab/latch")
    #v(1em)

    #item("WARDuino: An embedded WebAssembly virtual machine", [2024-06 | *Tom Lauwaerts*, Robbert Gurdeep Singh, Christophe Scholliers | Journal of Computer Languages], [Presented at the International Conference on the Art, Science, and Engineering of Programming 2022, during a poster session and a dedicated demonstration.], doi: "https://doi.org/10.1016/j.cola.2024.101268", repo: "https://github.com/TOPLLab/WARDuino/", docs: "https://topllab.github.io/WARDuino/")
    #v(1em)
    
    #item("Out-of-Place Debugging on Constraint Devices with the EDWARD Debugger (Demo)", [2023-07 | *Tom Lauwaerts*, Carlos Rojas Castillo, Elisa Gonzalez Boix, Christophe Scholliers | Short paper (DEBT'23)], [Demo presentation at the first Workshop on Future Debugging Techniques (DEBT'23).], doi: "https://doi.org/10.1145/3605155.3605862", slide: "https://tolauwae.github.io/debt.demo/")
    #v(1em)

    #item("Demo: Debugging Constraint Devices with EDWARD", [2023-06 | *Tom Lauwaerts*, Carlos Rojas Castillo, Elisa Gonzalez Boix, Christophe Scholliers | Short paper (MobiSys'23)], [Demo and poster presentation at the 21st ACM International Conference on Mobile Systems, Applications, and Services (MobiSys'23).], doi: "https://doi.org/10.1145/3581791.3597293")
    #v(1em)

    #item("Event-Based Out-of-Place Debugging", [2022-09 | *Tom Lauwaerts*, Carlos Rojas Castillo, Robbert Gurdeep Singh, Matteo Marra, Christophe Scholliers, Elisa Gonzalez Boix | Conference paper (MPLR'22)], [I presented this work at the main track of the 19th International Conference on Managed Programming Languages & Runtimes (MPLR'22).], doi: "https://doi.org/10.1145/3546918.3546920", docs: "https://topllab.github.io/WARDuino/reference/edward/", slide: "https://tolauwae.github.io/mplr22/")

    //#v(1em)
    ////#heading(level: 2, grid(columns: 4, column-gutter: 3pt, align: alignment.horizon, "Artifacts", link("https://github.com/TOPLLab", image("icons/git.svg", height: 1em))))
    //== Other research activities
