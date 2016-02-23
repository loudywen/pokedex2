//
//  Pokemon.swift
//  pokedex2
//
//  Created by Di Wen Lao on 2/23/16.
//  Copyright © 2016 DevonLao. All rights reserved.
//

import Foundation

class Pokemon{
    private var _name:String!
    private var _pokedexId:Int!
    
    var name:String{
        return _name
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String,pokedexId:Int){
        self._name = name
        self._pokedexId = pokedexId
    }
}