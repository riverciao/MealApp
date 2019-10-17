//
//  MealTableViewCell.swift
//  MealApp
//
//  Created by Ciao on 2019/9/11.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit
import SnapKit

class MealTableViewCell: UITableViewCell {

  class var identifier: String {
    return String(describing: self)
  }
  
  lazy var favButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "ic-fav-off"), for: .normal)
    button.setImage(UIImage(named: "ic-fav-on"), for: .selected)
    button.addTarget(self, action: #selector(favButtonAction), for: .touchUpInside)
    return button
  }()
  
  var model: MealModel?

  @IBOutlet weak var mealImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    mealImageView.contentMode = .scaleAspectFill
    mealImageView.clipsToBounds = true
    
    self.addSubview(favButton)
    favButton.snp.makeConstraints { (make) in
      make.height.equalTo(24)
      make.width.equalTo(24)
      make.top.equalToSuperview().offset(10)
      make.trailing.equalToSuperview().offset(-10)
    }
  }
  
  @objc func favButtonAction() {
    print("favButtonAction")
    guard let meal = model else { return }
    self.model?.isFav = !meal.isFav
    favButton.isSelected = !favButton.isSelected
  }
  
  func setup(with model: MealModel) {
    self.model = model
    mealImageView.image = UIImage(named: model.imageName)
    titleLabel.text = model.title
    favButton.isSelected = model.isFav
  }
    
}
