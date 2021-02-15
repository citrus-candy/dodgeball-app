//
//  Event.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/11/08.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {

    @objc dynamic var date: String = ""
    @objc dynamic var text: String = ""
    
}
