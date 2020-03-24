
import Foundation

// MARK: - PredictHQResult
struct PredictHQResult: Codable {
    let count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, title, resultDescription: String
    let category: String
    let entities: [Entity]
    let start, end, updated, firstSeen: String
    let timezone: String
    let duration, rank: Int
    let country: String
    let location: [Double]

    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case category, entities, start, end, updated
        case firstSeen = "first_seen"
        case timezone, duration, rank, country, location
    }
}

// MARK: - Entity
struct Entity: Codable {
    let entityID, type, name, formattedAddress: String
    
    enum CodingKeys: String, CodingKey {
        case entityID = "entity_id"
        case type, name
        case formattedAddress = "formatted_address"
    }
}

