//
//  TrainerDataViewController.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 01/03/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit

class TrainerDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var loggedTrainer: Trainer!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var trainerPic: UIImageView!
    
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerTown: UILabel!
    
    var selectedPokemon:Pokemon!
    
    override func viewDidLoad() {
        print(loggedTrainer.name)
            super.viewDidLoad()
        print("controller certo")
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.backgroundColor = UIColor.clearColor()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "capa")?.drawInRect(CGRect(x: 0, y: self.navigationController!.navigationBar.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height+self.navigationController!.navigationBar.bounds.height))
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = UIColor(patternImage: image)
        trainerName.text = loggedTrainer.name!
        trainerTown.text = loggedTrainer.town!
        selectedPokemon = loggedTrainer.onHandPokemons![0]
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            let url = NSURL(string: self.loggedTrainer.photo!)!
            if let image = UIImage(data: NSData(contentsOfURL: url)!){
                dispatch_async(dispatch_get_main_queue()) {
                    self.trainerPic.image = image
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let poke = loggedTrainer.onHandPokemons![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("pokeCell")
        //cell?.backgroundColor = UIColor.clearColor()
        let pokePhoto = cell?.viewWithTag(10) as! UIImageView
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)) {
            let url = NSURL(string: poke.icon)!
            if let image = UIImage(data: NSData(contentsOfURL: url)!){
                dispatch_async(dispatch_get_main_queue()) {
                    pokePhoto.image = image
                }
            }
        }
        let pokeLevel =  cell?.viewWithTag(20) as! UILabel
        pokeLevel.text = "LVL \(poke.level!)"
        let pokeName = cell?.viewWithTag(30) as! UILabel
        pokeName.text = poke.name
        let pokeLifeBar = cell?.viewWithTag(40) as! UIProgressView
        pokeLifeBar.progress = Float(poke.status.health)
        let pokeLife = cell?.viewWithTag(50) as! UILabel
        pokeLife.text = "\(poke.status.health) / \(poke.status.health)"
        return cell!
        //return UITableViewCell()
        //return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

            return "Pokemon List"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectedPokemon = loggedTrainer.onHandPokemons![indexPath.row]
        self.performSegueWithIdentifier("gotoPokemonData", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loggedTrainer.onHandPokemons!.count
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        
        let pokeData = segue.destinationViewController as! PokemonDataViewController
        pokeData.pokemon = selectedPokemon
    }
    
    
}
