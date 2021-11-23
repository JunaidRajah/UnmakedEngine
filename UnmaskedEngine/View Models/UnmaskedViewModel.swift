//
//  UnmaskedViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/19.
//

import Foundation

public enum HeroInfoGroup: String, CaseIterable {
    case powerstats = "Power Stats"
    case biography = "Biography"
    case appearance = "Appearance"
    case work = "Work History"
    case connections = "Connections"
}

public class UnmaskedViewModel {
    
    private weak var delegate: UnmaskedViewModelDelegate?
    private var hero: SuperheroResponseModel?
    public var currentInfoGroup: HeroInfoGroup = .powerstats
    
    public var heroInfoGroup: HeroInfoGroup {
        get {
            currentInfoGroup
        }
        set {
            currentInfoGroup = newValue
        }
    }
    
    public init(hero: SuperheroResponseModel, heroInfoGroup: HeroInfoGroup, delegate: UnmaskedViewModelDelegate) {
        self.hero = hero
        self.delegate = delegate
        self.currentInfoGroup = heroInfoGroup
    }
    
    public func nextGroup() {
        switch currentInfoGroup {
        case .powerstats:
            currentInfoGroup = .biography
        case .biography:
            currentInfoGroup = .appearance
        case .appearance:
            currentInfoGroup = .work
        case .work:
            currentInfoGroup = .connections
        case .connections:
            currentInfoGroup = .powerstats
        }
        delegate?.changeGroup()
    }
    
    public var chosenHero: SuperheroResponseModel? {
        hero
    }
}
