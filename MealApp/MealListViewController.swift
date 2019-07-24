//
//  MealListViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/7/24.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class MealListViewController: UIViewController {

  
  @IBOutlet weak var addMealButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addMealButton.addTarget(self, action: #selector(someFuntion), for: .touchUpInside)
  }
  
  @objc func someFuntion() {
    print("ya")
    let detailVC = MealDetailViewController()
    present(detailVC, animated: true) {
      print("yaya")
    }
  }
}
