//
//  SuperheroResponseModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

import Foundation

@objcMembers public class SuperheroResponseModel: NSObject, Codable {
    let response: String?
    let id: String
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let work: Work
    let connections: Connections
    let image: Image
}

@objcMembers public class Appearance: NSObject, Codable  {
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

@objcMembers public class Biography: NSObject, Codable  {
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let firstAppearance: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case aliases, publisher, alignment
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
    }
}

@objcMembers public class Connections: NSObject, Codable  {
    let groupAffiliation: String
    let relatives: String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

@objcMembers public class Image: NSObject, Codable  {
    let url: String
}

@objcMembers public class Powerstats: NSObject, Codable  {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

@objcMembers class Work: NSObject, Codable  {
    let occupation: String
    let base: String
}

public func convertToDictionary(hero: SuperheroResponseModel) -> NSDictionary {
    
    
    let dictionary = ["id": hero.id,
                    "name": hero.name,
                    "publisher": hero.biography.publisher,
                    "alignment": hero.biography.alignment,
                    "image": hero.image.url] as [String : String]

    return dictionary as NSDictionary
}
