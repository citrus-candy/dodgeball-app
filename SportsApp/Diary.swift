//
//  Diary.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/11/06.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit
import RealmSwift

class Diary: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var context: String = ""
    
    override static func primaryKey() -> String {
        return "date"
    }
}
