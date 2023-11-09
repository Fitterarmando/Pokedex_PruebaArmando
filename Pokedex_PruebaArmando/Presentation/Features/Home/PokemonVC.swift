//
//  HomeVC.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import UIKit
import Resolver
import Combine

class PokemonVC : UIViewController {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var height: UILabel!
    @IBOutlet var weight: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var search: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var barWidth: NSLayoutConstraint!
    private let viewModel = PokemonViewModel()
    private var anyCancellable : [AnyCancellable] = []
    
    func configure(item: PokemonModel) {
        name.text = item.name
        height.text = "\(item.height)"
        weight.text = "\(item.weight)"
        image.image = nil
        image.startShimmering()
        image.load(url: item.sprites.frontShiny){
            self.image.stopShimmering()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        subscriptions()
        viewModel.getRandomPokemon()
        search.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func subscriptions() {
        viewModel.loading.sink {_ in} receiveValue: { loading in
            if loading {
                self.activityIndicator.startAnimating()
                self.activityIndicator.isHidden = false
            } else {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }.store(in: &anyCancellable)
        
        viewModel.pokemon.sink {_ in} receiveValue: { pokemon in
            self.configure(item: pokemon)
        }.store(in: &anyCancellable)
        
        viewModel.bar.sink {_ in} receiveValue: { progress in
            let maxWidth = self.search.frame.width
            let newWidth = maxWidth * CGFloat(progress)
            self.barWidth.constant = newWidth
        }.store(in: &anyCancellable)
    }
    
    @objc func didTapButton() {
        viewModel.runCounterImmediately()
    }
}

