//
//  SuperheroSearchRepository.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public struct SuperheroSearchRepository: SuperheroRepositorySearchable {

    public init() {}
    
    public func fetchHeroes(with name: String, completion: @escaping superheroSearchResult) {
        if let url = URLHeroStringBuilder(for: name) {
            let session =  URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, _, error) in
                if let safeData = data {
                    DispatchQueue.main.async {
                        do {
                            let superhero = try JSONDecoder().decode(SuperheroSearchResponseModel.self, from: safeData)
                            completion(.success(superhero))
                            
                        } catch {
                            completion(.failure(error))
                        }
                    }
                } else {
                    completion(.failure(error as! URLError))
                }
            }
            task.resume()
        }
    }
    
    private func URLHeroStringBuilder(for name: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.URLBuilder.scheme
        urlComponents.host = Constants.URLBuilder.host
        urlComponents.path = Constants.URLBuilder.path
        let apiKeyQueryItem = URLQueryItem(name: Constants.URLBuilder.apiKeyString,
                                           value: Constants.URLBuilder.apiKey)
        let heroSearchQueryItem = URLQueryItem(name: Constants.URLBuilder.searchString, value: name)
        urlComponents.queryItems = [apiKeyQueryItem, heroSearchQueryItem]
        let heroURL = urlComponents.url?.absoluteString
            .replacingOccurrences(of: "?", with: "")
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "&", with: "")
        return URL(string: heroURL!)
    }
}
