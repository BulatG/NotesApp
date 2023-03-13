//
//  RealmModel.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 08.03.2023.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    @objc dynamic var title = ""
    @objc dynamic var specification = ""
}
