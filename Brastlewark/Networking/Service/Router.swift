//
//  Router.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
  private var task: URLSessionTask?
  
  func request(_ route: EndPoint, completition: @escaping NetworkRouterCompletion) {
    let session = URLSession.shared
    
    do {
      let request = try self.buildRequest(from: route)
      task =  session.dataTask(with: request, completionHandler: { (data, response, error) in
      })
    } catch {
      completition(nil, nil, error)
    }
    self.task?.resume()
  }
  
  func cancel() {
    self.task?.cancel()
  }

  fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
//    var request = URLRequest(url: ,
//                             cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
//                             timeoutInterval: 10.0)
    var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path))
    
    request.httpMethod = route.httpMethod.rawValue
    
    do {
      
      switch route.task {
      case .request:
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      case .download:
        print("here")
      }
      
      return request
      
    } catch {
      throw error
    }
    
  }
}
