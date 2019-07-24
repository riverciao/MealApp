//
//  ViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/6/26.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var mealTextField: UITextField!
  @IBOutlet weak var mealImgeView: UIImageView!
  @IBOutlet weak var contentLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mealNameLabel.text = "my meal"
    mealTextField.placeholder = "please enter what you eat"
    mealImgeView.image = #imageLiteral(resourceName: "ebi.jpg")
    mealImgeView.image = UIImage(named: "ebi")
    
    mealNameLabel.textColor = UIColor.purple
    contentLabel.textColor = #colorLiteral(red: 1, green: 0.4228495769, blue: 0.476951094, alpha: 1)
    contentLabel.backgroundColor = UIColor(red: 22/255.0, green: 210/255.0, blue: 50/255.0, alpha: 1)
    
    mealTextField.delegate = self
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("textFieldShouldReturn")
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    print("textFieldDidEndEditing")
    contentLabel.text = "我今天吃了\(textField.text)"
  }

}
