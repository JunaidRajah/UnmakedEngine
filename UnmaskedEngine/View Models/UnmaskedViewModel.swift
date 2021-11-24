//
//  UnmaskedViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/19.
//

import Foundation

public enum HeroInfoGroup: String, CaseIterable {
    case powerStats = "Power Stats"
    case biography = "Biography"
    case appearance = "Appearance"
    case work = "Work History"
    case connections = "Connections"
}

public class UnmaskedViewModel {
    
    private weak var delegate: UnmaskedViewModelDelegate?
    private var hero: SuperheroResponseModel
    public var currentInfoGroup: HeroInfoGroup = .powerStats
    
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
        case .powerStats:
            currentInfoGroup = .biography
        case .biography:
            currentInfoGroup = .appearance
        case .appearance:
            currentInfoGroup = .work
        case .work:
            currentInfoGroup = .connections
        case .connections:
            currentInfoGroup = .powerStats
        }
        delegate?.changeGroup()
    }
    
    public var chosenHero: SuperheroResponseModel {
        hero
    }
    
    public var powerstats: PowerStats {
        hero.powerstats
    }
    
    public var biography: Biography {
        hero.biography
    }
    
    public var appearance: Appearance {
        hero.appearance
    }
    
    public var work: Work {
        hero.work
    }
    
    public var connections: Connections {
        hero.connections
    }
}
