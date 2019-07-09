//
//  URLParameterEncoder.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
  public static func encode(urlRequest: inout URLRequest) throws {
    guard let urlRequest = urlRequest.url else { throw NetworkError.missingURL }
  }
}
