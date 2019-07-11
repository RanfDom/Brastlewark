//
//  HomeInteractor.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
  weak var presenter: HomeInteractorOutputProtocol?
  var APIDataManager: HomeAPIDataManagerInputProtocol?
  var localDatamanager: HomeLocalDataManagerInputProtocol?
  var gnomes: [Gnome] = []
  
  func fetchHome() {
    NetworkManager().requestGnomes { (result) in
      switch result {
      case .success(let brastlewark):
        self.gnomes = brastlewark.gnomes
        self.presenter?.homeDidLoad(gnomes: self.gnomes.map({ GnomeViewModel($0) }))
      case .error(let error):
        self.presenter?.onError(error)
      }
    }
  }
  
  func fetchGnome(with id: Int) {
    self.presenter?.didFind(gnomes.filter({ $0.id == id }).first)
  }
}
