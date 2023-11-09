//
//  AppModule.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 09/11/23.
//

import Foundation
import Alamofire
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        
        register { RequestInterceptor() }.implements(Alamofire.RequestInterceptor.self)
        register { Session(interceptor: optional()) }
        register { APIManager(sessionManager: resolve()) }
      
        register { PokemonApi(apiManager: resolve()) }
       
        register { PokemonRepositoryImpl(pokemonListApi: resolve()) }.implements(PokemonRepository.self)
    }
}

