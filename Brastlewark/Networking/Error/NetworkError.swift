//
//  NetworkError.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
  case encodingFailed = "Encoding Failed"
  case missingURL = "URL is nill"
}
