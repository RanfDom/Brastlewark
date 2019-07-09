//
//  NetworkRouter.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
  associatedtype EndPoint: EndPointType
  func request(_ route: EndPoint, completition: @escaping NetworkRouterCompletion)
  func cancel()
}
