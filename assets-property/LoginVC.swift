//
//  LoginVC.swift
//  assetz-property
//
//  Created by Anant on 07/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        // Dismiss this view and present Registerview
        let presentingVC = self.presentingViewController
        let register = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterVC")
        
        
        LoginManager.sharedInstance.loginWithUsername(usernameText.text!, password: passwordText.text!) { (result) in
            print(1)
            if result {
                //logged in!
                print(2)
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                print(3)
                //Log in Failed
                self.dismissViewControllerAnimated(true) { () -> Void in
                    presentingVC?.presentViewController(register!, animated: true, completion: nil)
                }
            }
        }
}
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        // Dismiss this view and present Registerview
        let presentingVC = self.presentingViewController
        let register = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterVC")
        
        dismissViewControllerAnimated(true) { () -> Void in
            
            presentingVC?.presentViewController(register!, animated: true, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
