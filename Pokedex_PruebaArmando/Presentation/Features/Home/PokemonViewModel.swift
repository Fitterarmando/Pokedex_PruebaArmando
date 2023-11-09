//
//  PokemonViewModel.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 09/11/23.
//

import Foundation
import Resolver
import Combine

public class PokemonViewModel {
    @Injected var pokemonRepository : PokemonRepository
    
    var loading = PassthroughSubject <Bool, Error>()
    var pokemon = PassthroughSubject <PokemonModel, Error>()
    var bar = PassthroughSubject <Float, Error>()
    
    let maxSeconds = 30
    var counter = 30
    private func runCounter() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.counter = self.counter - 1
            
            let progress = Float(self.counter)/Float(self.maxSeconds)
            self.bar.send(progress)
            
            if (self.counter <= 0) {
                self.getRandomPokemon()
            } else {
                self.runCounter()
            }
        }
    }
    
    func runCounterImmediately() {
        self.counter = 0
    }
    
    func getRandomPokemon() {
        self.loading.send(true)
        pokemonRepository.getPokemon(id: self.getRandomId()) { result in
            self.loading.send(false)

            switch result {
            case.success(let pokemon):
                self.pokemon.send(pokemon)
                
            case .failure(_): break
            }
            self.counter = 30
            self.runCounter()
        }
    }
    
    func getRandomId() -> Int {
        return Int.random(in: 1..<100)
    }
}
