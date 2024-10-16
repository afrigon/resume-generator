import SwiftUI

extension Font.Weight {
    var value: Int {
        switch self {
            case .ultraLight:
                100
            case .thin:
                200
            case .light:
                300
            case .regular:
                400
            case .medium:
                500
            case .semibold:
                600
            case .bold:
                700
            case .heavy:
                800
            case .black:
                900
            default:
                400
        }
    }
}
