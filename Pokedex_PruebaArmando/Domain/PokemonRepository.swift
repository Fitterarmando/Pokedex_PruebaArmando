//
//  PokemonRepository.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation

protocol PokemonRepository {
    func getPokemon(id: Int, completion: @escaping (Result<PokemonModel, ApiError>) -> Void)
}
