import SwiftUI

struct ResumeSection<Content: View>: View {
    let title: String
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(verbatim: title)
                .font(.apercu(size: 14, weight: .regular))
                .foregroundStyle(Color.accent)
            
            Divider()
            
            content()
        }
    }
}
