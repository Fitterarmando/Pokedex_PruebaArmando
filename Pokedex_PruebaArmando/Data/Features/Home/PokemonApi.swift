//
//  PokemonApi.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation
import Alamofire


struct PokemonApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getPokemon(id: Int, completion: @escaping(Result<PokemonModel, ApiError>) -> Void) {
        let request = Request(method: .get, path: "pokemon/\(id)")
        apiManager.request(urlRequest: request) { (result: Swift.Result<PokemonModel, ApiError>) in completion(result)
        }
    }
}
