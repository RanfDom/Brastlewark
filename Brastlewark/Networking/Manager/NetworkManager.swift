//
//  NetworkManager.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
  case success
  case authenticationError = "You need to be authenticated first."
  case badRequest = "Bad request"
  case outdated = "The url you requested is outdated."
  case failed = "Network request failed."
  case noData = "Response returned with no data to decode."
  case unableToDecode = "We could not decode the response."
}

enum Result<String>{
  case success
  case failure(String)
}

struct NetworkManager {
  static let environment : NetworkEnvironment = .production
  let router = Router<GnomesAPI>()
  
  func requestGnomes(completion:@escaping (GnomesServiceResult) -> ()) {
    
    router.request(.gnomes) { (data, response, error) in
      
      if error != nil {
        completion(.error("Please check your network connection."))
      } else if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(.error("No data"))
            return
          }
          do {
            let brastlewarkInfo = try JSONDecoder().decode(Brastlewark.self, from: responseData)
            completion(.success(brastlewarkInfo))
            
          }catch {
            completion(.error("Parser error"))
          }
        case .failure(let error):
          completion(.error(error))
        }
      }
      
    }
    
  }
  
  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
}
