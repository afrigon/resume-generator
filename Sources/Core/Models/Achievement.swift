public struct Achievement: Codable {
    let name: String
    let description: String?
    
    var value: String {
        if let description {
            "\(name) (\(description))"
        } else {
            name
        }
    }
}

