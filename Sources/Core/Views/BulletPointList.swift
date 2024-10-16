import SwiftUI

struct BulletPointList: View {
    let items: [String]
    
    var body: some View {
        ForEach(items, id: \.self) { item in
            Text(verbatim: "   •   ")
                .font(.apercu(size: 11, weight: .black))
            +
            Text(verbatim: item)
        }
    }
}
