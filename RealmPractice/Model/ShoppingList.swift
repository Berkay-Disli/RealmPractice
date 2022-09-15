//
//  ShoppingList.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import Foundation
import RealmSwift

class ShoppingList: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    @Persisted var items = List<ShoppingItem>()
    
    override class func primaryKey() -> String? {
        "id"
    }
}
