import SwiftUI

struct ResumeView: View {
    let resume: Resume
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ResumeHeaderView(resume: resume)
                .frame(maxWidth: .infinity)
            
            ResumeSection(title: "Projects / Competitions") {
                Group {
                    ForEach(resume.projects) { project in
                        HStack(alignment: .firstTextBaseline, spacing: 2) {
                            Text(verbatim: project.name)
                                .font(.system(size: 10, weight: .bold))
                            
                            Text(verbatim: "(\(project.url.absoluteString))")
                                .font(.system(size: 8, weight: .regular))
                        }
                        BulletPointList(items: [project.description])
                    }
                    
                    Text(verbatim: "Competitions")
                        .font(.system(size: 10, weight: .bold))

                    BulletPointList(items: resume.achievements.map { items in
                        String(items.map(\.value).joined(separator: "  ·  "))
                    })
                }
            }
            
            ResumeSection(title: "Experiences") {
                ForEach(resume.experiences) { experience in
                    VStack(spacing: 2) {
                        HStack {
                            Text(verbatim: experience.employer)
                                .font(.system(size: 11, weight: .bold))
                            
                            Spacer()
                            
                            Text(verbatim: experience.location)
                                .foregroundStyle(Color.accent)
                                .font(.system(size: 9, weight: .bold))
                        }
                        
                        HStack {
                            Text(verbatim: experience.role)
                                .font(.system(size: 9, weight: .bold))
                                .foregroundStyle(Color.title)
                            
                            Spacer()
                            
                            Text(verbatim: experience.dates)
                                .font(.system(size: 9))
                                .foregroundStyle(Color.title)
                        }
                    }
                    
                    BulletPointList(items: experience.highlights)
                }
            }
            
            ResumeSection(title: "Education") {
                ForEach(resume.educations) { education in
                    Text(verbatim: education.description)
                }
            }

            ResumeSection(title: "Interests") {
                Text(verbatim: resume.interests.joined(separator: "  ·  "))
            }
        }
        .font(.system(size: 10, weight: .regular))
        .padding(LetterPaper.margin)
        .frame(
            width: LetterPaper.width,
            height: LetterPaper.height,
            alignment: .center
        )
        .foregroundStyle(Color.text)
        .background(Color.pageBackground)
    }
}


#Preview("afrigon") {
    if let resume = Resume.afrigon {
        ResumeView(resume: resume)
    } else {
        Text("Could not load data.")
    }
}
