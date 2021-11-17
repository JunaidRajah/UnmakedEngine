//
//  superheroCollectionModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public struct superheroCollectionModel {
    public let ref: DatabaseReference?
    public let key: String
    public let id: String
    public let name: String
    public let publisher: String
    public let alignment: String
    public let image: String
    
    public init(id: String, name: String, publisher: String, alignment: String, image: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.id = id
        self.name = name
        self.publisher = publisher
        self.alignment = alignment
        self.image = image
    }
    
    public init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let id = value["id"] as? String,
            let name = value["name"] as? String,
            let publisher = value["publisher"] as? String,
            let alignment = value["alignment"] as? String,
            let image = value["image"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.id = id
        self.name = name
        self.publisher = publisher
        self.alignment = alignment
        self.image = image
    }
}
