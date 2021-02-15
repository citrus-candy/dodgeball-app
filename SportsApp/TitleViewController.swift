//
//  TitleViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2020/01/10.
//  Copyright © 2020 Sandan Yosuke. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toMainMenuViewController", sender: nil)
    }
    
    @IBAction func historyButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toHistoryTableViewController", sender: nil)
    }
    
}
