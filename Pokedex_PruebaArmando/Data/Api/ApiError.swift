//
//  ApiError.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation

public enum ApiError: Error {
    case jsonDecodingError
    case serverError(error: String)
    case badRequestData(data: Data)
    case badRequest
    case responseErrorMessage(message: String)
    case notInternetConection
    case multipartEncodingError
    case apiDefinedError(error: ApiDefinedError)
}

public struct ApiDefinedError: Codable {
    public let error: String
    public let errorDescription: String
}

