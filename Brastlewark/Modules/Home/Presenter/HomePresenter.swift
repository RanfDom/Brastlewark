//
//  HomePresenter.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
  weak var view: HomeViewProtocol?
  var interactor: HomeInteractorInputProtocol?
  var wireFrame: HomeWireFrameProtocol?
  
  var gnomes: [GnomeViewModel] = []
  
  func fetchHome() {
    interactor?.fetchHome()
  }
  
  func fetchGnome(at index: IndexPath) {
    interactor?.fetchGnome(with: index.row)
  }
}

extension HomePresenter: HomeInteractorOutputProtocol {
  func homeDidLoad(gnomes: [GnomeViewModel]) {
    self.gnomes = gnomes
    view?.show(gnomes: gnomes.map({ GnomeCardModel($0) }))
  }
  
  func onError(_ error: String) {
    view?.show(error: error)
  }

  func didFind(_ gnome: Gnome?) {
    guard let gnome = gnome else {
      view?.show(error: "Gnome not found")
      return
    }
    // send to detail
  }
}
