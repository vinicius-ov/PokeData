//
//  ViewController.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 29/02/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let repoJSON = [
        "id" : 40102424,
        "name": "Gloss",
        "description" : "A shiny JSON parsing library in Swift",
        "html_url" : "https://github.com/hkellaway/Gloss",
        "owner" : [
            "id" : 5456481,
            "login" : "hkellaway",
            "html_url" : "https://github.com/hkellaway"
        ],
        "language" : "Swift"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func butt(sender: AnyObject) {
        let poke = Pokemon(json: repoJSON)
        
    }
}

