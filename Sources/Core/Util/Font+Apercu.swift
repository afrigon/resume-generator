import SwiftUI
import CoreText

extension Font {
    
    @MainActor
    public static func apercu(size: CGFloat, weight: Weight = .regular) -> Font {
        FontRegister.shared.register(fontName: "ApercuFlex")

        return VariableFont.create(
            name: "Apercu Pro",
            size: size,
            weight: weight
        )
    }
}
