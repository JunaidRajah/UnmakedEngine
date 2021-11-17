//
//  HeroCollectionViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public enum heroPublisher: String, CaseIterable {
    case Marvel = "Marvel Comics"
    case DC = "DC Comics"
    case StarWars = "George Lucas"
    case Anime = "Shueisha"
    case DarkHorse = "Dark Horse Comics"
    case Other
}

public class HeroCollectionViewModel {
    
    private var collectionRepository: UserRepositoryFetchable
    private weak var delegate: CollectionViewModelDelegate?
    private var repository: SuperheroRepositoryFetchable
    private var response: [superheroCollectionModel]?
    private var heroToSend: SuperheroResponseModel?
    
    public init(repository: SuperheroRepositoryFetchable,
         collectionRepository: UserRepositoryFetchable,
         delegate: CollectionViewModelDelegate) {
        self.repository = repository
        self.collectionRepository = collectionRepository
        self.delegate = delegate
    }
    
    public func fetchCollection(heroGroup: heroPublisher) {
        collectionRepository.fetchUserHeroCollection(completion: { [weak self] result in
            switch result {
            case .success(let collectionResponse):
                self?.collectionFromGroup(from: collectionResponse, heroGroup: heroGroup)
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        })
    }
    
    private func collectionFromGroup(from heroCollection: [superheroCollectionModel], heroGroup: heroPublisher) {
        var groupItems: [superheroCollectionModel] = []
        switch heroGroup {
        case .Marvel:
            groupItems = self.filterCollection(with: heroGroup.rawValue, collection: heroCollection)
        case .DC:
            groupItems = self.filterCollection(with: heroGroup.rawValue, collection: heroCollection)
        case .StarWars:
            groupItems = self.filterCollection(with: heroGroup.rawValue, collection: heroCollection)
        case .Anime:
            groupItems = self.filterCollection(with: heroGroup.rawValue, collection: heroCollection)
        case .DarkHorse:
            groupItems = self.filterCollection(with: heroGroup.rawValue, collection: heroCollection)
        case .Other:
            for hero in heroCollection {
                if hero.publisher != heroPublisher.Marvel.rawValue &&
                    hero.publisher != heroPublisher.DC.rawValue &&
                    hero.publisher != heroPublisher.StarWars.rawValue &&
                    hero.publisher != heroPublisher.Anime.rawValue &&
                    hero.publisher != heroPublisher.DarkHorse.rawValue {
                    groupItems.append(hero)
                }
            }
        }
        self.response = groupItems
        self.delegate?.refreshViewContents()
    }
    
    private func filterCollection(with publisher: String, collection: [superheroCollectionModel]) -> [superheroCollectionModel] {
        var filteredCollection: [superheroCollectionModel] = []
        for hero in collection {
            if hero.publisher == publisher {
                filteredCollection.append(hero)
            }
        }
        return filteredCollection
    }
    
    public func selectHero(at index: Int) {
        guard let response = self.response else { return }
        repository.fetchHero(with: response[index].id, completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.heroToSend = response
                self?.delegate?.loadHeroFromCollection()
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        })
    }
    
    public var selectedHero: SuperheroResponseModel? {
        heroToSend
    }
    
    public var myHeroList: [superheroCollectionModel]? {
        response
    }
    
    public var heroListCount: Int {
        myHeroList?.count ?? 0
    }
    
    public func hero(at index: Int) -> superheroCollectionModel? {
        guard let response = self.response else {return nil}
        return response[index]
    }
}
