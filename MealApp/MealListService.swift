//
//  MealListService.swift
//  MealApp
//
//  Created by Ciao on 2019/11/6.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import Foundation

struct MealListService {
  
  func fetchMealList(completion: @escaping ([MealModel]) -> Void) {
    let urlStr = "https://course.aids61517.tw/product.php"
    guard let url = URL(string: urlStr) else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print(error)
        return
      }
      
      guard let data = data else { return }
      
      let dataStr = String(data: data, encoding: .utf8)
      print("dataStr \(dataStr ?? "no data str")")
      
      do {
        guard let dataDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
        guard let resultDic = dataDic["result"] as? [[String: Any]] else { return }
//        print("resultDic \(resultDic)")
        guard let resultData = try? JSONSerialization.data(withJSONObject: resultDic, options: []) else { return }
          
        let mealList = try JSONDecoder().decode([MealModel].self, from: resultData)
        completion(mealList)
      } catch {
        print("error:\(error)")
      }
      
    }.resume()
  }
}
