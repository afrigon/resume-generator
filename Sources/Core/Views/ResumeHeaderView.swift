import SwiftUI

struct ResumeHeaderView: View {
    let resume: Resume
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Group {
                Text(verbatim: resume.firstName)
                +
                Text(verbatim: " ")
                +
                Text(verbatim: resume.lastName)
                    .bold()
            }
            .font(.system(size: 15))
            .foregroundStyle(Color.title)
            
            Text(verbatim: resume.contact(separator: "  |  "))
        }
    }
}
