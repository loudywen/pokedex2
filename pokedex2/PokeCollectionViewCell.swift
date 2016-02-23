//
//  PokeCollectionViewCell.swift
//  pokedex2
//
//  Created by Di Wen Lao on 2/23/16.
//  Copyright © 2016 DevonLao. All rights reserved.
//

import UIKit

class PokeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var name:UILabel!
    
    
    var pokemonViewCell: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
       layer.cornerRadius = 10
      
    }
    
    func configureCollectionViewCell(pokemonObj:Pokemon){
        self.pokemonViewCell = pokemonObj
        thumbImg.image = UIImage(named:"\(self.pokemonViewCell.pokedexId)")
        name.text = self.pokemonViewCell.name.capitalizedString
    }
    
}
