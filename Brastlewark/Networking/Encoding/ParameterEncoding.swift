//
//  ParameterEncoding.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

public protocol ParameterEncoder {
  static func encode(urlRequest: inout URLRequest) throws
}
