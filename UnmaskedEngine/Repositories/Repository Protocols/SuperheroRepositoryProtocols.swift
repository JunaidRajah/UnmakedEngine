//
//  SuperheroRepositoryProtocols.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public typealias superheroResult = (Result<SuperheroResponseModel, Error>) -> Void
public typealias superheroSearchResult = (Result<SuperheroSearchResponseModel, Error>) -> Void

public protocol SuperheroRepositoryFetchable {
    func fetchHero(with id: String, completion: @escaping superheroResult)
}

public protocol SuperheroRepositorySearchable {
    func fetchHeroes(with name: String, completion: @escaping superheroSearchResult)
}
