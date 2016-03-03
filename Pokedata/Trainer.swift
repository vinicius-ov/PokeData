//
//  TrainerData.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import Gloss
import Alamofire

struct Trainer: Decodable {

    var name:			String?
    var age:			Int?
    var photo:			String?
    var town:			String?
    var onHandPokemons:	Array<Pokemon>?
    
    var json: [String:AnyObject]!
    
    init?(json: JSON){
        self.name = "name" <~~ json
        self.age = "age"  <~~ json
        self.photo = "photo" <~~ json
        self.town = "town" <~~ json

        let pokeArray = json.valueForKeyPath("onHandPokemons") as! [JSON]
        self.onHandPokemons = Array<Pokemon>.fromJSONArray(pokeArray)
    }
    
    
}
