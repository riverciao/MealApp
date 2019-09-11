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
  
  // MARK: - View life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addMealButton.addTarget(self, action: #selector(addMealButtonAction), for: .touchUpInside)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: MealTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MealTableViewCell.identifier)
  }
  
  @objc func addMealButtonAction() {
    print("ya")
    let detailVC = MealDetailViewController()
    present(detailVC, animated: true) {
      print("yaya")
    }
  }
  
  // MARK: - UITableViewDelegate
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as! MealTableViewCell
    cell.mealImageView.image = UIImage(named: "ebi")
    cell.titleLabel.text = "好吃ㄉ"
    return cell
  }
}
