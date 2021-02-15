//
//  HistoryTableViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2020/01/10.
//  Copyright © 2020 Sandan Yosuke. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryTableViewController: UITableViewController {

    var ATeamPoint: [Int] = []
    var BTeamPoint: [Int] = []
    var time: [String] = []
    var selectTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        let obj = realm.objects(GameInfomation.self)
        for objData in obj {
            ATeamPoint.append(objData.ATeamPoint)
            BTeamPoint.append(objData.BTeamPoint)
            time.append(objData.nowTime)
        }
    }

    // MARK: - Table view data source

    // cellの総数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ATeamPoint.count
    }
    
    // cellの値
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        cell.textLabel?.text = time[indexPath.row] + "   " + String(ATeamPoint[indexPath.row]) + "  vs  " + String(BTeamPoint[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTime = time[indexPath.row]
        self.performSegue(withIdentifier: "toResultViewController2", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultViewController2" {
            let resultView = segue.destination as! ResultViewController
            resultView.selectedTime = selectTime
            resultView.segueFlag = true
        }
    }

}
