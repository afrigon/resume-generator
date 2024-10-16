import SwiftUI

struct BulletPointList: View {
    let items: [String]
    
    var body: some View {
        ForEach(items, id: \.self) { item in
            Text(verbatim: "  •  ").fontWeight(.black)
            +
            Text(verbatim: item)
        }
    }
}
