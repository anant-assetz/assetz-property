//
//  ViewController.swift
//  assets-property
//
//  Created by Anant on 06/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Username: UILabel!
    var person: Person!
    
    func checkLogin() {
        
        if LoginManager.sharedInstance.isLoggedIn == false {
            
            //Show Login View
            let login = storyboard?.instantiateViewControllerWithIdentifier("LoginVC")
            presentViewController(login!, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        performSelector("checkLogin", withObject: self, afterDelay: 1)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if LoginManager.sharedInstance.isLoggedIn == true {
            //var personA: Person!
            //Username.text = person.firstname
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

