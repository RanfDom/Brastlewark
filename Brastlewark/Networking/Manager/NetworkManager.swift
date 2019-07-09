//
//  NetworkManager.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

struct NetworkManager {
  private let router = Router<GnomesAPI>()

  func getGnomes(completition: @escaping(_ gnomes: [Gnome]?, _ error: String?)->()) {
    router.request(.all) { (data, response, error) in
      guard error == nil else {
        completition(nil, "Review your network connection")
        return
      }
      
      if let response = response as? HTTPURLResponse {
        
        let result = self.handleNetworkResponse(response)
        switch result {
          case .success:
            guard let responseData = data else {
              completition(nil, NetworkResponse.noData.rawValue)
              return
            }
            do {
              let apiResponse = try JSONDecoder().decode(GnomesApiResponse.self, from: responseData)
              completition(apiResponse.gnomes, nil)
            } catch {
                completition(nil, NetworkResponse.unableToDecode.rawValue)
            }
        case .failure(let networkFailureError):
          completition(nil, networkFailureError)
        }
        
      }
      
    }
  }
  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
    case 200...299: return .success
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }

}

enum NetworkResponse: String {
  case success
  case badRequest = "Bad request"
  case failed = "Network reques failed"
  case noData = "Response returned with no data"
  case unableToDecode = "Response could not be decoded"
}

enum Result<String> {
  case success
  case failure(String)
}


