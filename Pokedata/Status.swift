//
//  Status.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import Gloss

struct Status: Decodable {
    var health:		Int!
    var attack:		Int!
    var defense:		Int!
    var spAttack:		Int!
    var spDefense:	Int!
    var speed:		Int!
    
    init?(json: JSON){
        self.health = "health" <~~ json
        self.attack = "attack" <~~ json
        self.defense = "defense" <~~ json
        self.spAttack = "spAttack" <~~ json
        self.spDefense = "spDefense" <~~ json
        self.speed = "speed" <~~ json
    }
}
