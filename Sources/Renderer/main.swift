import SwiftUI
import ResumeCore

let url = URL
    .downloadsDirectory
    .appendingPathComponent("resume.pdf")

guard let resume = Resume.afrigon else {
    print("Could not load resume data.")
    exit(1)
}

ResumeRenderer.render(resume, to: url)
