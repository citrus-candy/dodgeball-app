//
//  TableViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/11/28.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {

    var array: [[[Int]]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array.removeLast()
        print("GameTableViewControllerArray")
        print(array)
    }

    // MARK: - Table view data source

    // cellの総数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    // cellの値
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        var tableText = ""
        
        
        for (index,elem) in array[indexPath.row].enumerated() {
            if index == 0 {
                let element_0 = elem[0]
                
                if element_0 > 0 {
                    tableText += "Aチーム背番号"
                } else {
                    tableText += "Bチーム背番号"
                }
                tableText += String(abs(element_0))
            } else if index == 1 {
                tableText += " → "
                let element_1 = elem[0]
                
                if element_1 > 0 {
                    tableText += "Aチーム背番号"
                } else {
                    tableText += "Bチーム背番号"
                }
                tableText += String(abs(element_1))
            } else if index == 2 {
                if elem[0] == 0 {
                    tableText += "　キャッチ"
                } else {
                    tableText += "　アウト"
                }
            }
            //print("\(index):\(elem)")
        }
        print(tableText)
        //cell.textLabel?.text = array[indexPath.row] as? String
        cell.textLabel?.text = tableText
        print(array[indexPath.row])
        
        
        return cell
    }

}
