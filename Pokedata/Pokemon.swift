//
//  Pokemon.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit
import Gloss

struct Pokemon: Decodable {
    
    var number:	Int!
    var name:	String!
    var icon: 	String!
    var image: 	String!
    var level:	Int!
    var type1:	String!
    var type2:	String?
    var status:	Status!
    var skills:	Array<Skill>!

    init?(json: JSON){
        self.number = "number" <~~ json
        self.name = "name" <~~ json
        self.icon = "icon" <~~ json
        self.image = "image" <~~ json
        self.level = "level" <~~ json
        self.type1 = "type1" <~~ json
        self.type2 = "type2" <~~ json
        self.status = "status" <~~ json
        
        let skillArray = json.valueForKeyPath("skills") as! [JSON]
        self.skills = Array<Skill>.fromJSONArray(skillArray)
        
    }
    
}
