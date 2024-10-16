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
                    .fontWeight(.black)
            }
            .font(.system(size: 18))
            .foregroundStyle(Color.title)
            
            HStack(alignment: .center, spacing: 2) {
                Text(verbatim: resume.contact(separator: "  |  "))
                
                loadImage(named: "github-mark")?
                    .resizable()
                    .frame(width: 10, height: 10)
            }
        }
    }
    
    private func loadImage(named name: String) -> Image? {
        guard let url = Bundle.module.url(forResource: name, withExtension: "png") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        guard let image = NSImage(data: data) else {
            return nil
        }
        
        return Image(nsImage: image)
    }
}
