//
//  Node.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 09.03.2023.
//

import Foundation
import RealmSwift
// модель объекта Realm для считывания данных
class Node: Object {
    @objc dynamic var specification = ""
}
