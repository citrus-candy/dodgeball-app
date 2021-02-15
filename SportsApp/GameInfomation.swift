//
//  GameInfomation.swift
//  SportsApp
//
//  Created by 三反陽介 on 2020/01/10.
//  Copyright © 2020 Sandan Yosuke. All rights reserved.
//

import Foundation
import RealmSwift
import Charts

class GameInfomation: Object {

    @objc dynamic var ATeamPoint: Int = 0
    @objc dynamic var BTeamPoint: Int = 0
    let ATeamDataList = List<ATeamPAClass>()
    let BTeamDataList = List<BTeamPAClass>()
    @objc dynamic var nowTime: String = ""

}

class ATeamPAClass: Object {
    @objc dynamic var ATeamPA: Int = 0
}

class BTeamPAClass: Object {
    @objc dynamic var BTeamPA: Int = 0
}
