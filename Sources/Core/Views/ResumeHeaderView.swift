import SwiftUI

struct ResumeHeaderView: View {
    let resume: Resume
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                Text(verbatim: resume.firstName)
                +
                Text(verbatim: " ")
                +
                Text(verbatim: resume.lastName)
                    .font(.apercu(size: 14, weight: .bold))
            }
            .font(.apercu(size: 14))
            .foregroundStyle(Color.title)
            
            Text(verbatim: resume.contact(separator: "   |   "))
        }
    }
}
