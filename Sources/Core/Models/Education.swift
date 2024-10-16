public struct Education: Codable, Identifiable {
    let institution: String
    let degree: String
    let year: Int
    let location: String
    
    public var id: String {
        "\(institution)_\(year)"
    }
    
    var description: String {
        "\(institution) - \(degree), \(year)"
    }
}
