import SwiftUI

public class FontRegister {
    @MainActor
    public static let shared: FontRegister = .init()
    
    private var registered: Set<String> = .init()
    
    func register(bundle: Bundle = .module, fontName: String, fontExtension: String = "ttf") {
        if registered.contains(fontName) {
            return
        }
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let dataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(dataProvider) else {
            print("Couldn't create font from: \(fontName).\(fontExtension)")
            return
        }

        var error: Unmanaged<CFError>?
        
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            print("Couldn't create font from: \(fontName).\(fontExtension)")
            return
        }
        
        registered.insert(fontName)
    }
}
