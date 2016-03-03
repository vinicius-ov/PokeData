//
//  LoginViewController.swift
//  Pokedata
//
//  Created by Vinicius Valvassori on 29/02/16.
//  Copyright © 2016 Vinicius Valvassori. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class LoginViewController: UIViewController, NSURLSessionTaskDelegate {
    
    var json: [String:AnyObject]!
    var trainer: Trainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "capa")?.drawInRect(self.view.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        
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
                    self.performSegueWithIdentifier("gotoTrainerData", sender: self)
                } catch {
                    print(error)
                }
            }else{
                print("deu merda")
                //mensagem de login falhado, avisar
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let page = segue.destinationViewController as! UINavigationController
        (page.viewControllers[0] as! TrainerDataViewController).loggedTrainer = trainer
//        let vc = segue.destinationViewController as! TrainerDataViewController
//    vc.loggedTrainer = trainer
    }
    
}