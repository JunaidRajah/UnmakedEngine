//
//  SuperheroSearchResponseModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public struct SuperheroSearchResponseModel: Codable {
    let response: String
    let resultsFor: String
    let results: [SuperheroResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case response, results
        case resultsFor = "results-for"
    }
}
