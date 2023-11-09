//
//  PokemonRepositoryImpl.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation
import Alamofire

class PokemonRepositoryImpl : PokemonRepository {
    
    private let pokemonApi : PokemonApi
    
    init(pokemonListApi : PokemonApi) {
        self.pokemonApi = pokemonListApi
    }
    
    func getPokemon(id: Int, completion: @escaping (Result<PokemonModel, ApiError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pokemonApi.getPokemon(id: id) { result in
                switch result {
                case.success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
