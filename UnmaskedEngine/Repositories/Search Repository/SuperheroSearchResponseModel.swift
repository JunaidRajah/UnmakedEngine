//
//  SuperheroSearchResponseModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public struct SuperheroSearchResponseModel: Codable {
    public let response: String
    public let resultsFor: String
    public let results: [SuperheroResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case response, results
        case resultsFor = "results-for"
    }
}
