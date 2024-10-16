import Foundation

public struct Project: Codable, Identifiable {
    let name: String
    let description: String
    let url: URL
    
    public var id: String {
        name
    }
}
