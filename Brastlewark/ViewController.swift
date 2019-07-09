//
//  ViewController.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var networkManager: NetworkManager!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let some = NetworkManager()
    networkManager = some
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    networkManager.getGnomes { (gnomes, error) in
      if let error = error {
        print(error)
      }
      if let gnomes = gnomes {
        print(gnomes)
      }
    }
  }
}

