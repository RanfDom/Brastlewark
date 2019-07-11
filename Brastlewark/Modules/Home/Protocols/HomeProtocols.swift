//
//  HomeProtocols.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: LoadableViewController, ErrorHandling {
  var presenter: HomePresenterProtocol? { get set }
  /**
   * Methods for communication PRESENTER -> VIEW
   */
  
  func show(gnomes: [GnomeCardModel])
}

protocol HomeWireFrameProtocol: class {
  static func buildHomeModule() -> Any
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}

protocol HomePresenterProtocol: class {
  var view: HomeViewProtocol? { get set }
  var interactor: HomeInteractorInputProtocol? { get set }
  var wireFrame: HomeWireFrameProtocol? { get set }
  /**
   * Methods for communication VIEW -> PRESENTER
   */

  func fetchHome()
  func fetchGnome(at index: IndexPath)
}

protocol HomeInteractorOutputProtocol: class {
  /**
   * Methods for communication INTERACTOR -> PRESENTER
   */
  
  func homeDidLoad(gnomes: [GnomeViewModel])
  func didFind(_ gnome: Gnome?)
  func onError(_ error: String)
}

protocol HomeInteractorInputProtocol: class {
  var presenter: HomeInteractorOutputProtocol? { get set }
  var APIDataManager: HomeAPIDataManagerInputProtocol? { get set }
  var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
  /**
   * Methods for communication PRESENTER -> INTERACTOR
   */
  
  func fetchHome()
  func fetchGnome(with id: Int)
}

protocol HomeAPIDataManagerInputProtocol: class {
  /**
   * Methods for communication INTERACTOR -> APIDATAMANAGER
   */
  
  func requestHome(completion: @escaping (GnomesServiceResult) -> ())
}

protocol HomeLocalDataManagerInputProtocol: class {
  /**
   * Methods for communication INTERACTOR -> LOCALDATAMANAGER
   */
  
  func getHome(completion: @escaping (GnomesServiceResult) -> ())
}
