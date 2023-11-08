//
//  SplashScreen.swift
//  Pokedex_PruebaArmando
//
//  Created by Juan Armando Frías Ramírez on 08/11/23.
//

import UIKit

class SplashScreen: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.alpha = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1.0
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                AppDelegate.singleton.goToHome()
            }
        }
    }
    
}
