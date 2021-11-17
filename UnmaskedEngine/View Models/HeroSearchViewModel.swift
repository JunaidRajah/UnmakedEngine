//
//  HeroSearchViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public class HeroSearchViewModel {
    private var repository: SuperheroRepositorySearchable
    private weak var delegate: ViewModelDelegate?
    private var response: SuperheroSearchResponseModel?
    private var heroToSend: SuperheroResponseModel?
    private var myHeroes = [SuperheroResponseModel]()
    
    public init(repository: SuperheroRepositorySearchable,
         delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    public func fetchHeroes(with name: String) {
        repository.fetchHeroes(with: name, completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.response = response
                self?.delegate?.refreshViewContents()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        })
    }
    
    public func selectHero(at index: Int) {
        guard let response = self.response else { return }
        heroToSend = response.results?[index]
    }
    
    public var selectedHero: SuperheroResponseModel? {
        heroToSend
    }
    
    public var myHeroList: [SuperheroResponseModel]? {
        response?.results
    }
    
    public var heroListCount: Int {
        myHeroList?.count ?? 0
    }
    
    public func hero(at index: Int) -> SuperheroResponseModel? {
        guard let response = self.response else {return nil}
        return response.results?[index]
    }
}
