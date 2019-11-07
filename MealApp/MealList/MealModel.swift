//
//  MealModel.swift
//  MealApp
//
//  Created by Ciao on 2019/9/25.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

class MealModel: Decodable {
  let title: String
  var imageName: String?
  var imageUrlStr: String?
  var isFav: Bool = false
  
  enum CodingKeys: String, CodingKey {
    case title = "name"
    case imageUrlStr = "image_url"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try container.decode(String.self, forKey: .title)
    self.imageUrlStr = try container.decode(String?.self, forKey: .imageUrlStr)
    self.imageName = nil
  }
  
  init(title: String, imageName: String) {
    self.title = title
    self.imageName = imageName
    self.imageUrlStr = nil
  }
}
