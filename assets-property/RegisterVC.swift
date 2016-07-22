//
//  RegisterVC.swift
//  assetz-property
//
//  Created by Anant on 07/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var telephoneText: UITextField!
    
    @IBAction func registerButtonTapped(sender: UIButton) {
       
        // Dismiss this view and present Registerview
        let presentingVC = self.presentingViewController
        let login = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC")
        
        RegisterManager.sharedInstance.registerWithUsername(usernameText.text!, email: emailText.text!,telephone: telephoneText.text!) { (result) in
            print(1)
            if result {
                //Registered OK!
                print(2)
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                print(3)
                //Log in Failed
                self.dismissViewControllerAnimated(true) { () -> Void in
                    presentingVC?.presentViewController(login!, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        let presentingVC = presentingViewController
        let login = storyboard?.instantiateViewControllerWithIdentifier("LoginVC")
        dismissViewControllerAnimated(true) { () -> Void in
            presentingVC?.presentViewController(login!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
