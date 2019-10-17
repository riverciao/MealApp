//
//  MealModel.swift
//  MealApp
//
//  Created by Ciao on 2019/9/25.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

class MealModel {
  let title: String
  let imageName: String
  var isFav: Bool = false
  
  init(title: String, imageName: String) {
    self.title = title
    self.imageName = imageName
  }
}
