import Foundation

public struct Resume: Codable {
    let firstName: String
    let lastName: String
    let jobRole: String
    let email: String
    let phone: String
    let website: URL
    let username: String
    
    let projects: [Project]
    let achievements: [[Achievement]]
    let experiences: [Experience]
    let educations: [Education]
    let interests: [String]
    
    public init(
        firstName: String,
        lastName: String,
        jobRole: String,
        email: String,
        phone: String,
        website: URL,
        username: String,
        projects: [Project],
        achievements: [[Achievement]],
        experiences: [Experience],
        educations: [Education],
        interests: [String]
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.jobRole = jobRole
        self.email = email
        self.phone = phone
        self.website = website
        self.username = username
        self.projects = projects
        self.achievements = achievements
        self.experiences = experiences
        self.educations = educations
        self.interests = interests
    }
    
    public init?(from url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.yearMonth)
        
        do {
            let resume = try decoder.decode(Resume.self, from: data)
            self = resume
        } catch let error {
            print(error)
            return nil
        }
    }
    
    public func contact(separator: String) -> String {
        [
            phone,
            email,
            website.absoluteString,
            username
        ].joined(separator: separator)
    }
}

extension Resume {
    
    @MainActor
    public static var afrigon: Resume? = {
        guard let url = Bundle.module.url(forResource: "afrigon", withExtension: "json") else {
            return nil
        }
        
        return Resume(from: url)
    }()
}
