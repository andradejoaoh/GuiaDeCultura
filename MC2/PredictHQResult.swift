// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let predictHQResult = try? newJSONDecoder().decode(PredictHQResult.self, from: jsonData)

import Foundation

// MARK: - PredictHQResult
struct PredictHQResult: Codable {
    let count: Int
//    let overflow: Bool
//    let next, previous: JSONNull
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, title, resultDescription: String
//    let scope: String
    let category: String
//    let labels: [String]
    let entities: [Entity]
    let start, end, updated, firstSeen: String
    let timezone: String
    let duration, rank: Int
    let country: String
    let location: [Double]
//    let state: String
//    let relevance: Int?
//    let placeHierarchies: [[String]]
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case category, entities, start, end, updated
        case firstSeen = "first_seen"
//        case placeHierarchies = "place_hierarchies"
        case timezone, duration, rank, country, location
//        case scope, labels, state, relevance
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

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
