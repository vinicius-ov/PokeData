//
//  LoginContainer.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 29/02/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import Gloss

struct LoginContainer: Glossy {
    
    var username:String?
    var password:String?
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.username,
            "login" ~~> self.password
            ])
    }
 
    init?(json: JSON){
        self.username = "username" <~~ json
        self.password = "password" <~~ json
    }
}



