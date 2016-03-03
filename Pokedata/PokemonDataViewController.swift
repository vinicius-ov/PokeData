//
//  PokemonDataViewController.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 02/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit

class PokemonDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pokemon:Pokemon!
    
    @IBOutlet weak var pokePhoto: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeTypes: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    @IBOutlet weak var pokeLevel: UILabel!
    
    @IBOutlet weak var pokeStatus: UILabel!
    @IBOutlet weak var pokeHealth: UILabel!
    @IBOutlet weak var pokeAttack: UILabel!
    @IBOutlet weak var pokeDefense: UILabel!
    @IBOutlet weak var pokeSpAttack: UILabel!
    @IBOutlet weak var pokeSpDefense: UILabel!
    @IBOutlet weak var pokeSpeed: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "capa")?.drawInRect(CGRect(x: 0, y: self.navigationController!.navigationBar.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height+self.navigationController!.navigationBar.bounds.height))
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = UIColor(patternImage: image)
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = pokemon.name
        // Do any additional setup after loading the view.
        pokeNumber.text = "No. \(pokemon.number)"
        pokeName.text = pokemon.name
        pokeTypes.text = pokemon.type1// + pokemon.type2! //bad
        if pokemon.type2 != nil{
                pokeTypes.text = pokeTypes.text! + " " + pokemon.type2!
        }
        pokeLevel.text     = "LVL. \(pokemon.level)"
        pokeHealth.text    = "Health : \(pokemon.status.health)"
        pokeAttack.text    = "Attack : \(pokemon.status.attack)"
        pokeDefense.text   = "Defense: \(pokemon.status.defense)"
        pokeSpAttack.text  = "Sp. Attack : \(pokemon.status.spAttack)"
        pokeSpDefense.text = "Sp. Defense: \(pokemon.status.spDefense)"
        pokeSpeed.text     = "Speed      : \(pokemon.status.speed)"
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            let url = NSURL(string: self.pokemon.image)!
            if let image = UIImage(data: NSData(contentsOfURL: url)!){
                dispatch_async(dispatch_get_main_queue()) {
                    self.pokePhoto.image = image
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return pokemon.skills[section].name
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let skill = pokemon.skills[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("pokeSkillCell")
        //(cell?.viewWithTag(10) as! UILabel).text = "Name: "+skill.name
        (cell?.viewWithTag(20) as! UILabel).text = "Type: "+skill.type
        (cell?.viewWithTag(30) as! UILabel).text = "Dam. Cat.: "+skill.damageCategory
        (cell?.viewWithTag(40) as! UILabel).text = "Power: \(skill.power!)"
        (cell?.viewWithTag(50) as! UILabel).text = "Accuracy: \(skill.accuracy!)"
        (cell?.viewWithTag(60) as! UILabel).text = "PP: \(skill.powerPoint!)"
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
