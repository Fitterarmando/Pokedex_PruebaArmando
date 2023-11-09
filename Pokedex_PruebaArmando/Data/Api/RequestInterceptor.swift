//
//  RequestInterceptor.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation
import Alamofire

class RequestInterceptor: Alamofire.RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var newRequest = urlRequest
        //newRequest.url = URL(string: "\(newRequest.url!.absoluteString)?api_key=\(APIManager.API_KEY)")
        
        completion(.success(newRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
    
}

