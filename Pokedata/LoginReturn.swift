//
//  LoginReturn.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import Gloss

struct LoginReturn: Decodable {
    
        var responde: Bool!
        var message: String!
        var data: Trainer?
        
        init?(json: JSON) {
            self.responde = "response" <~~ json
            self.message = "message" <~~ json
            
        }
        
    

}
