//
//  GnomesAPI.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

public enum GnomesAPI {
  case all
}

extension GnomesAPI: EndPointType {
  var baseURL: URL {
    guard let url = URL(string: "https://raw.githubusercontent.com/") else { fatalError("baseURL could not be configured.")}
    return url
  }
  
  var path: String {
    return "rrafols/mobile_test/master/data.json"
  }
  
  var httpMethod: HTTPMethod {
    return .get
  }
  
  var task: HTTPTask {
    return .request
  }
  
  
}
