//
//  ViewController.swift
//  pokedex2
//
//  Created by Di Wen Lao on 2/23/16.
//  Copyright © 2016 DevonLao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var CollectionView: UICollectionView!
    var pokemonArray = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self
        CollectionView.dataSource = self
        paserPokemonCSV()
    }
    
    func paserPokemonCSV(){
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do{
             let csv = try CSV.init(contentsOfURL: path)
             let rows = csv.rows
            for row in rows{
                //id,identifier,species_id,height,weight,base_experience,order,is_default

                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let pokemonObj = Pokemon(name: name, pokedexId: pokeId)
                pokemonArray.append(pokemonObj)
            }
        }catch{
            print("paser error")
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCollectionViewCell{
            
             cell.configureCollectionViewCell(pokemonArray[indexPath.row])
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    
}

