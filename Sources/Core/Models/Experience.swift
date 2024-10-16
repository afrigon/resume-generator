import Foundation

public struct Experience: Codable, Identifiable {
    let employer: String
    let role: String
    let startDate: Date
    let endDate: Date?
    let location: String
    let highlights: [String]
    
    public var id: String {
        employer
    }
    
    public var dates: String {
        let startString: String = DateFormatter.shortDate.string(from: startDate)
        let endString: String
        
        if let endDate {
            endString = DateFormatter.shortDate.string(from: endDate)
        } else {
            endString = "Present"
        }
        
        return "\(startString) - \(endString)"
    }
}
