//
//  Storage.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 08.03.2023.
//

import Foundation
import RealmSwift

struct Storage {
    let realm = try! Realm()
    var items: Results<Node>!
    
    func getData() -> Results<Node> { // метод получения данных из хранилища
         realm.objects(Node.self)
    }
}





