# resume-generator

Renders a resume to a single-page US Letter PDF from a structured JSON
definition. The layout is a SwiftUI view rendered through `ImageRenderer`
into a PDF drawing context, so the document is typeset once in code and the
content lives in data. Requires macOS 15.

## Usage

```sh
mise run run
```

Loads the resume definition bundled with the package and writes
`resume.pdf` to `~/Downloads`.

The definition lives in `Sources/Core/Data/afrigon.json` and decodes into
the `Resume` model: contact information (name, job role, email, phone,
website, username), `projects`, `achievements` as groups displayed
together, `experiences`, `educations` and `interests`. Dates are written as
`yyyy-MM`; an experience without an `endDate` renders as "Present".

## Development

```sh
mise run build     # swift build
mise run lint      # swiftlint, strict
mise run format    # swiftformat
```

Tooling is pinned in `mise.toml`; `mise install` fetches the Swift
toolchain, swiftlint and swiftformat at the versions the package is checked
against.
