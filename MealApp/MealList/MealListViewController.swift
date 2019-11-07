//
//  MealListViewController.swift
//  MealApp
//
//  Created by Ciao on 2019/7/24.
//  Copyright © 2019 Pinkoi. All rights reserved.
//

import UIKit

class MealListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MealDetailViewControllerDelegate {
  
  
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
    
    let service = MealListService()
    service.fetchMealList { [weak self] (mealList) in
      self?.dataSource = mealList
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  @objc func addMealButtonAction() {
    let detailVC = MealDetailViewController()
    detailVC.delegate = self
    present(detailVC, animated: true)
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
  
  // MARK: - MealDetailViewControllerDelegate
  
  func mealDetailViewController(didGetMealName: String?) {
    guard let mealName = didGetMealName else { return }
    dataSource.append(MealModel(title: mealName, imageName: "ebi"))
    tableView.reloadData()
  }
}
