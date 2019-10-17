//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/7/24.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

protocol MealDetailViewControllerDelegate: AnyObject {
  func mealDetailViewController(didGetMealName: String?)
}

class MealDetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var contentImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var closeButton: UIButton!
  var name: String?
  
  @IBOutlet weak var mealNameTextField: UITextField!
  
  weak var delegate: MealDetailViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    mealNameTextField.delegate = self
  }
  
  @objc func closeButtonAction() {
    print("closeButtonAction")
    dismiss(animated: true, completion: nil)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    print("get text\(textField.text)")
    delegate?.mealDetailViewController(didGetMealName: textField.text)
  }
}
