#import "data.typ"

// Colour scheme

#let colour-schemes = (
  jet: (
    highlight: rgb("#2A2D31"),
    header-background: rgb("#D8E1EA"),
    subdued: rgb("#566B82"),
    divider: rgb("#566B82"),
  ),
  green: (
    highlight: rgb(0, 88, 66),
    header-background: rgb("#e8f2ef"),
    subdued: rgb("#526b65"),
    divider: rgb("#8fa39f"),
  ),
)

#let colour-scheme = colour-schemes.jet

#let black-color = rgb("#000000")
#let highlight = colour-scheme.highlight
#let header-background = colour-scheme.header-background
#let subdued = colour-scheme.subdued
#let divider-color = colour-scheme.divider

#let smaller(it) = text(size: 8pt, it)

#let dividor = [
    #v(1.0em)
    #line(
      length: 100%,
      stroke: (paint: divider-color, thickness: 0.45pt),
    )
]

// Styling

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

#let linkedin(id, color: black-color) = {
    social("https://linkedin.com/in/" + id, "icons/linkedin.svg", "")
}

#let github(id, color: black-color) = {
    social("https://github.com/" + id, "icons/github.svg", "")
}

#let homepage(id, color: black-color) = {
    social(id, "icons/homepage.svg", "")
}

#let mail(id, color: black-color) = {
    social("mailto:" + id, "icons/mail.svg", id)
}

#let phone(number, color: black-color) = [
    #grid(columns: 2, align: alignment.horizon, column-gutter: 3pt, image("icons/phone.svg", width: 1em, height: 1em), number)
]

#let researchgate(id, color: black-color) = {
    social("https://researchgate.net/profile/" + id, "icons/researchgate.svg", "")
}

#let googlescholar(id, color: black-color) = {
    social(id, "icons/google-scholar.svg", "")
}

#let orcid(id, color: black-color, full: false) = {
    social("https://orcid.org/" + id, "icons/orcid.svg", [#if full [#id] else []])
}

#let opensource(project, url) = {
  let content = (github(url), project)
  set text(fill: highlight, weight: "bold", size: 8pt)
  link(url, grid(columns: 4, align: alignment.horizon, column-gutter: 1pt, ..content))
}

// Building blocks

#let item(head, quiet, description, oneline: false, description-gap: 0.1em, url: none, doi: none, repo: none, artifact: none, docs: none, slide: none) = [
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
            #v(description-gap)
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
    ], description, oneline: oneline, description-gap: -0.2em)
]

#let render-item(entry, show-description: true, description-fill: none) = item(
    entry.head,
    entry.at("quiet", default: entry.at("venue", default: "")),
    if not show-description {
        []
    } else if description-fill == none {
        entry.description
    } else {
        text(fill: description-fill, entry.description)
    },
    oneline: entry.at("oneline", default: false),
    url: entry.at("url", default: none),
    doi: entry.at("doi", default: none),
    repo: entry.at("repo", default: none),
    artifact: entry.at("artifact", default: none),
    docs: entry.at("docs", default: none),
    slide: entry.at("slide", default: none),
)

#let own-author-pattern = regex("Tom Lauwaerts")

#let publication-reference(publication) = {
    let reference = (
        publication.date
        + " | "
        + publication.authors.join(", ")
        + " | "
        + publication.venue
    )
    [
        #show own-author-pattern: strong
        #reference
    ]
}

#let publication-links(entry) = {
    let links = ()
    for (field, label) in (
        ("doi", "Paper"),
        ("repo", "Code"),
        ("artifact", "Artifact"),
        ("slide", "Presentation"),
    ) {
        let url = entry.at(field, default: none)
        if url != none {
            links.push(link(url, label))
        }
    }

    if links.len() > 0 {
        block(above: 0.5em, below: 0.2em)[
            #set text(weight: 500, fill: highlight)
            #grid(columns: links.len(), column-gutter: 2em, ..links)
        ]
    }
}

#let publication-type-pill(entry) = box(
    fill: header-background,
    radius: 2pt,
    inset: (x: 3pt, y: 1.4pt),
)[
    #text(size: 6.5pt, weight: 500, fill: subdued, tracking: 0.02em)[
        #upper(entry.type)
    ]
]

#let publication-title(entry) = {
    let artifact = entry.at("artifact", default: none)
    if artifact == none {
        grid(
            columns: (auto, auto),
            column-gutter: 0.6em,
            align: alignment.horizon,
            entry.head,
            publication-type-pill(entry),
        )
    } else {
        grid(
            columns: (auto, auto, auto),
            column-gutter: 0.5em,
            align: alignment.horizon,
            entry.head,
            link(artifact, image("icons/artifact.svg", height: 0.9em)),
            publication-type-pill(entry),
        )
    }
}

#let render-publication(entry, show-description: true, show-links: true) = [
    #item(
        publication-title(entry),
        publication-reference(entry),
        [],
        oneline: entry.at("oneline", default: false),
        url: entry.at("url", default: none),
    )
    #if show-links [
        #publication-links(entry)
    ]
    #if show-description and entry.description != "" [
        #v(0.1em)
        #entry.description
    ]
]

#let render-experience(entry) = experience(
    entry.employer,
    entry.role,
    entry.start,
    entry.end,
    entry.description,
    duration: entry.at("duration", default: none),
    oneline: entry.at("oneline", default: false),
)

#let render-language(entry) = item(
    entry.name,
    entry.proficiency,
    [],
    oneline: true,
)

#let language-summary(entries) = entries.map(
    entry => [#strong(entry.name) #lower(entry.proficiency)],
).join([ #sym.dot.op ])

#let open-source-projects(projects) = {
    let content = ()
    for (index, project) in projects.enumerate() {
        if index > 0 { content.push(sym.dot.op) }
        content.push(opensource(project.name, project.github))
    }
    grid(columns: 5, column-gutter: 5pt, ..content)
}

#let render-volunteer(entry) = {
    let description = if entry.description == none {
        open-source-projects(entry.projects)
    } else {
        entry.description
    }
    item(
        entry.head,
        entry.quiet,
        description,
        oneline: entry.at("oneline", default: false),
    )
}

#let profile-links() = grid(
    columns: 3,
    column-gutter: 3pt,
    orcid(data.research-profiles.orcid),
    researchgate(data.research-profiles.researchgate),
    googlescholar(data.research-profiles.google-scholar),
)

// Styling

#set text(font: ("Lato"), size: 10pt)

#show heading.where(level: 2): it => {
    set block(below: 0.5em, above: 1.0em)
    it
    line(length: 100%, stroke: (paint: divider-color, thickness: 0.5pt))
    v(0.5em)
}

// Content

#let title = [
        #show heading: set block(below: 0.4em)
        #show heading: set text(font: "Lusitana", weight: 700, size: 1.9em, spacing: 0.2em)
        #set par(leading: 0.2em)

        #heading[#text(fill: subdued, size: 18pt, style: "italic")[#data.profile.honorific] #data.profile.title]
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
            link("mailto:" + data.profile.email, data.profile.email),
            sym.dot.op,
            data.profile.phone,
            sym.dot.op,
        [
            #set text(size: 10pt)
            #grid(columns: 4, column-gutter: 3pt, align: alignment.horizon,
                linkedin(data.profile.linkedin),
                homepage(data.profile.homepage),
                github(data.profile.github))
        ]
        )
    ]
]

#let specialism = text(size: 8pt)[
        #set text(fill: subdued)
        #data.profile.specialism
    ]


#[
    #block(
        width: 100%,
        fill: header-background,
        inset: (top: 0pt, bottom: 0.6cm),
        outset: (x: sidemargin, top: sidemargin),
    )[
        #set align(center)
        #title
        #contact
        #specialism
    ]
]

#let outreach = data.volunteer-work.find(
    entry => entry.head == "Science communication and outreach",
)

#let education = [
#grid(columns: columns, [
    === Education // Opleiding
], [
    #for entry in data.education {
        render-item(entry)
    }
])
]

#v(0.5cm, weak: true)

#grid(columns: columns, [
    === Work experience
], [
    #for entry in data.work-experience {
        render-experience(entry)
    }
])

#dividor
#education

#let additional-information = [
#dividor
#grid(columns: columns, [
    === Additional \ information
], [
    #render-item(outreach, description-fill: subdued)
    #v(0.2em)
    #text(weight: 700)[Languages] \
    #text(fill: subdued)[#language-summary(data.languages)]
])
]

#let highlighted-publication-title = "MIO: Multiverse Debugging in the Face of Input/Output"
#let highlighted-publication = data.publications.find(
    publication => publication.head == highlighted-publication-title,
)

#let research-highlight = [

#dividor

#grid(columns: columns, [
    === Highlighted research

    #smaller(profile-links())

], [#render-publication(highlighted-publication, show-description: false, show-links: false)])
]

#let presentations = [
#dividor
#grid(columns: columns, [
    === Conference talks & \ demonstrations
], [
    #for entry in data.presentations {
        render-item(entry)
    }
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
    #for entry in data.academic-services {
        render-item(entry, description-fill: subdued)
    }
])
]
#international

#let honors = [

#dividor

#grid(columns: columns, [
    === Awards
], [
    #for entry in data.honors {
        render-item(entry, description-fill: subdued)
    }
])
]

#additional-information

#honors

// Appendix

    #heading(level: 2, grid(columns: 4, column-gutter: 3pt, align: alignment.horizon, "Scientific publications", smaller(orcid(data.research-profiles.orcid)), smaller(researchgate(data.research-profiles.researchgate)), smaller(googlescholar(data.research-profiles.google-scholar))))

    #for (index, publication) in data.publications.enumerate() {
        let spacing = if index > 0 { v(1em) } else { [] }
        spacing + render-publication(publication, show-description: false, show-links: false)
    }
