//
//  HomeWireframe.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

class HomeWireFrame: HomeWireFrameProtocol {
  
  class func createHomeViewController() -> HomeViewController {
    return HomeViewController.instantiate()
  }
  
  static func buildHomeModule() -> Any {
    // Generating module components
    let view = createHomeViewController()
    let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
    let interactor: HomeInteractorInputProtocol = HomeInteractor()
    let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
}
