//
//  SuperheroResponseModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

import Foundation

@objcMembers public class SuperheroResponseModel: NSObject, Codable {
    public let response: String?
    public let id: String
    public let name: String
    public let powerstats: Powerstats
    public let biography: Biography
    public let appearance: Appearance
    public let work: Work
    public let connections: Connections
    public let image: Image
}

@objcMembers public class Appearance: NSObject, Codable  {
    public let gender: String
    public let race: String
    public let height: [String]
    public let weight: [String]
    public let eyeColor: String
    public let hairColor: String

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

@objcMembers public class Biography: NSObject, Codable  {
    public let fullName: String
    public let alterEgos: String
    public let aliases: [String]
    public let placeOfBirth: String
    public let firstAppearance: String
    public let publisher: String
    public let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case aliases, publisher, alignment
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
    }
}

@objcMembers public class Connections: NSObject, Codable  {
    public let groupAffiliation: String
    public let relatives: String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

@objcMembers public class Image: NSObject, Codable  {
    public let url: String
}

@objcMembers public class Powerstats: NSObject, Codable  {
    public let intelligence: String
    public let strength: String
    public let speed: String
    public let durability: String
    public let power: String
    public let combat: String
}

@objcMembers public class Work: NSObject, Codable  {
    public let occupation: String
    public let base: String
}

public func convertToDictionary(hero: SuperheroResponseModel) -> NSDictionary {
    
    
    let dictionary = ["id": hero.id,
                    "name": hero.name,
                    "publisher": hero.biography.publisher,
                    "alignment": hero.biography.alignment,
                    "image": hero.image.url] as [String : String]

    return dictionary as NSDictionary
}
