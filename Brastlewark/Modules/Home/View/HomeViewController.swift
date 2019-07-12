//
//  HomeViewController.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
  var presenter: HomePresenterProtocol?
  
  var gnomes: [GnomeCardModel] = []
  
  @IBOutlet weak var gnomesTableView: UITableView!
  
  static var storyboardFileName: String {
    return "Home"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gnomesTableView.delegate = self
    gnomesTableView.dataSource = self
    gnomesTableView.register(GnomeViewCell.self, forCellReuseIdentifier: GnomeViewCell.reusableId)
    presenter?.fetchHome()
  }
  
  func show(gnomes: [GnomeCardModel]) {
    DispatchQueue.main.async { // Correct
      self.gnomes = gnomes
      self.gnomesTableView.reloadData()
    }
  }
  
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gnomes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GnomeViewCell.reusableId) as? GnomeViewCell else {
      return UITableViewCell()
    }
    cell.configure(with: gnomes[indexPath.row])
    return cell
  }
  
}
