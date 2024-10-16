import CoreText
import SwiftUI

struct VariableFont {
    enum Variables: Int, CustomStringConvertible {
        case weight = 2003265652
        case width = 2003072104
        case opticalSize = 1869640570
        case grad = 1196572996
        case slant = 1936486004
        case xtra = 1481921089
        case xopq = 1481592913
        case yopq = 1498370129
        case ytlc = 1498696771
        case ytuc = 1498699075
        case ytas = 1498693971
        case ytde = 1498694725
        case ytfi = 1498695241
        
        var description: String {
            switch self {
                case .weight:
                    return "Weight"
                case .width:
                    return "Width"
                case .opticalSize:
                    return "Optical Size"
                case .grad:
                    return "Grad"
                case .slant:
                    return "Slant"
                case .xtra:
                    return "Xtra"
                case .xopq:
                    return "Xopq"
                case .yopq:
                    return "Yopq"
                case .ytlc:
                    return "Ytlc"
                case .ytuc:
                    return "Ytuc"
                case .ytas:
                    return "Ytas"
                case .ytde:
                    return "Ytde"
                case .ytfi:
                    return "Ytfi"
            }
        }
    }
    
    private static func createCTFont(name: String, size: CGFloat, weight: Font.Weight) -> CTFont {
        let attributes: [CFString: Any] = [
            kCTFontFamilyNameAttribute: name,
            kCTFontVariationAttribute: [
                Variables.weight.rawValue: weight.value
            ]
        ]
        
        let descriptor = CTFontDescriptorCreateWithAttributes(attributes as CFDictionary)
        
        return CTFontCreateWithFontDescriptor(descriptor, size, nil)
    }
    
    static func create(name: String, size: CGFloat, weight: Font.Weight) -> Font {
        Font(createCTFont(name: name, size: size, weight: weight))
    }
}
