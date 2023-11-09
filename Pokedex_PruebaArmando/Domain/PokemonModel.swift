//
//  PokemonDBModel.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import Foundation

struct PokemonModel : Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
}

struct Sprites : Codable {
    let frontShiny: String
}

