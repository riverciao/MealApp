//
//  MealListViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/7/24.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class MealListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var addMealButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  var dataSource = [MealModel]()
  
  // MARK: - View life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addMealButton.addTarget(self, action: #selector(addMealButtonAction), for: .touchUpInside)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: MealTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MealTableViewCell.identifier)
    
    dataSource = [
      MealModel(title: "1", imageName: "ebi"),
      MealModel(title: "2", imageName: "ebi"),
      MealModel(title: "3", imageName: "ebi"),
      MealModel(title: "4", imageName: "ebi"),
      MealModel(title: "5", imageName: "ebi"),
      MealModel(title: "2", imageName: "ebi"),
      MealModel(title: "3", imageName: "ebi"),
      MealModel(title: "4", imageName: "ebi"),
      MealModel(title: "5", imageName: "ebi")
    ]
  }
  
  @objc func addMealButtonAction() {
    print("ya")
    let detailVC = MealDetailViewController()
    present(detailVC, animated: true) {
      print("yaya")
    }
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as! MealTableViewCell
    let model = dataSource[indexPath.row]
    cell.setup(with: model)
    print("cell \(cell) at indexPath \(indexPath)")
    return cell
  }
}
