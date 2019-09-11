//
//  MealTableViewCell.swift
//  MealApp
//
//  Created by Ciao on 2019/9/11.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

  class var identifier: String {
    return String(describing: self)
  }
  
  @IBOutlet weak var mealImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    mealImageView.contentMode = .scaleAspectFill
    mealImageView.clipsToBounds = true
  }
    
}
