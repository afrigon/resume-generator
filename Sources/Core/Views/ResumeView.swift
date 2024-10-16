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
                        Text(verbatim: project.name)
                            .font(.apercu(size: 11, weight: .bold))
                        BulletPointList(items: [project.description])
                    }
                    
                    Text(verbatim: "Competitions")
                        .font(.apercu(size: 11, weight: .bold))

                    BulletPointList(items: resume.achievements.map { items in
                        String(items.map(\.value).joined(separator: "   ·   "))
                    })
                }
            }
            
            ResumeSection(title: "Experiences") {
                ForEach(resume.experiences) { experience in
                    VStack {
                        HStack {
                            Text(verbatim: experience.employer)
                                .font(.apercu(size: 11, weight: .bold))
                            
                            Spacer()
                            
                            Text(verbatim: experience.location)
                                .foregroundStyle(Color.accent)
                                .font(.apercu(size: 11, weight: .bold))
                        }
                        
                        HStack {
                            Text(verbatim: experience.role)
                                .font(.apercu(size: 11))
                                .foregroundStyle(Color.title)
                            
                            Spacer()
                            
                            Text(verbatim: experience.dates)
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
                Text(verbatim: resume.interests.joined(separator: "   ·   "))
            }
        }
        .font(.apercu(size: 11, weight: .thin))
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
