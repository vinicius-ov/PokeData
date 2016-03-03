//
//  Skill.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import Gloss

struct Skill: Decodable {
    var name:		String!
    var type:		String!
    var damageCategory:	String!
    var power:		Int!
    var accuracy:		Int!
    var powerPoint:	Int!
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.type = "type" <~~ json
        self.damageCategory = "damageCategory" <~~ json
        self.power = "power" <~~ json
        self.accuracy = "accuracy" <~~ json
        self.powerPoint = "powerPoint" <~~ json
    }
}
