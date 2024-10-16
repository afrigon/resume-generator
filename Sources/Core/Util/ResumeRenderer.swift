import SwiftUI

public struct ResumeRenderer {
    
    @MainActor
    public static func render(_ resume: Resume, to url: URL) {
        let renderer = ImageRenderer(content: ResumeView(resume: resume))

        renderer.render { size, renderContext in
            var size = LetterPaper.rect

            guard let pdfContext = CGContext(
                url as CFURL,
                mediaBox: &size,
                nil
            ) else {
                return
            }
            
            pdfContext.beginPDFPage(nil)

            renderContext(pdfContext)

            pdfContext.endPDFPage()
            pdfContext.closePDF()
        }
    }
}
