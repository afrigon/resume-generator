import CoreGraphics

struct LetterPaper {
    static let dotsPerInch: CGFloat = 72.0
    static let pageWidth: CGFloat = 8.5
    static let pageHeight: CGFloat = 11.0
    
    static var width: CGFloat {
        pageWidth * dotsPerInch
    }
    
    static var height: CGFloat {
        pageHeight * dotsPerInch
    }
    
    static var margin: CGFloat {
        dotsPerInch * 1
    }

    static let rect: CGRect = CGRect(x: 0, y: 0, width: width, height: height)
}

