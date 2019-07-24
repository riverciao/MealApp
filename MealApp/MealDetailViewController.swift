//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/7/24.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
  
  @IBOutlet weak var contentImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var closeButton: UIButton!
  var name: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
  }
  
  @objc func closeButtonAction() {
    print("closeButtonAction")
    dismiss(animated: true, completion: nil)
  }
}
