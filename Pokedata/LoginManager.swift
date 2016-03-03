//
//  LoginManager.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 03/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit
import Alamofire

class LoginManager: NSObject {

    var json: [String:AnyObject]!
    var trainer:Trainer!
    
    
    func login(){
        Alamofire.request(.GET, "http://server03.local:60080/login", parameters: ["user": "ash","password": "mistyS2"]).response { request, response, data, error in
            print(request)
            print(response)
            print(error)
            if response!.statusCode == 200{
                do {
                    self.json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? [String: AnyObject]
                    print(self.json.valueForKeyPath("data"))
                    self.json = self.json.valueForKeyPath("data") as! [String:AnyObject]
                    self.trainer = Trainer(json: self.json)
                    //self.performSegueWithIdentifier("gotoTrainerData", sender: self)
                } catch {
                    print(error)
                }
            }else{
                print("deu merda")
                //mensagem de login falhado, avisar
            }
        }
        
    }
    
    
}
