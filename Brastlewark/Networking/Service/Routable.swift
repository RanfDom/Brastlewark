//
//  Routable.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/10/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

protocol Routable {
  var baseURL: URL { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }
}

enum GnomesServiceResult {
  case success(Brastlewark)
  case error(String)
}

enum ProfileError: Error {
  case fileNotFound
  case invalidURL
}
