//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Oscar De La Lanza on 24/07/21.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stats: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUi()
    }
    
    let pokemon: Pokemon = Pokemon(name: "Charmander", order: 38, type: "Fire",
        stats: [
            (name: "HP", power: 55),
            (name: "Attack", power: 35),
            (name: "Deffense", power: 99)], image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
    
    func setUi() {
        name.text = pokemon.name.uppercased()
        number.text = "#\(pokemon.order)"
        type.text = pokemon.type.lowercased()
        
        // set image
        let url = URL(string: pokemon.image)
        if let unwrappedURL = url {
            image.sd_setImage(with: unwrappedURL, completed: nil)
        }
        
        // set radious
        stats.roundCorners(withRadious: 30)
    }
}

struct Pokemon {
    let name: String
    let order: Int
    let type: String
    let stats: [(name: String, power: Int)]
    let image: String
}

extension UIView {
    func roundCorners(withRadious radious: CGFloat ) {
        layer.cornerRadius = radious
    }
}
