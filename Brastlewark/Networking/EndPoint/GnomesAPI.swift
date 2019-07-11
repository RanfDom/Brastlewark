//
//  GnomesAPI.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
  case qa
  case production
  case staging
}

public enum GnomesAPI {
  case gnomes
}

extension GnomesAPI: Routable {
  
  var environmentBaseURL : String {
    switch NetworkManager.environment {
    case .production: return "https://raw.githubusercontent.com/rrafols/"
    case .qa: return "https://raw.githubusercontent.com/rrafols/"
    case .staging: return "https://raw.githubusercontent.com/rrafols/"
    }
  }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }
  
  var path: String {
    switch self {
    case .gnomes:
      return "mobile_test/master/data.json"
    }
  }
  
  var httpMethod: HTTPMethod {
    return .get
  }
  
  var task: HTTPTask {
    switch self {
    case .gnomes:
      return .request
    }
  }
  
  var headers: HTTPHeaders? {
    return nil
  }
}
