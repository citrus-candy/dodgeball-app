//
//  SidemenuViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/10/11.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit

class SidemenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showContentView(animated: Bool) {
          if animated {
              UIView.animate(withDuration: 0.3) {
                  self.contentRatio = 1.0
              }
          } else {
              contentRatio = 1.0
          }
      }
    
    private var contentRatio: CGFloat {
           get {
               return contentView.frame.maxX / contentMaxWidth
           }
           set {
               let ratio = min(max(newValue, 0), 1)
               contentView.frame.origin.x = contentMaxWidth * ratio - contentView.frame.width
               contentView.layer.shadowColor = UIColor.black.cgColor
               contentView.layer.shadowRadius = 3.0
               contentView.layer.shadowOpacity = 0.8

               view.backgroundColor = UIColor(white: 0, alpha: 0.3 * ratio)
           }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
