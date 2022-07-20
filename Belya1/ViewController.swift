//
//  ViewController.swift
//  Belya1
//
//  Created by Aly Code on 17/07/2022.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func register_pressed(_ sender: Any) {
        
    }
    
    @IBAction func login_pressed(_ sender: Any) {
        
        
        let email_text = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass_text = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email_text, password: pass_text) { (result, error) in
            
            if error != nil {
                // Couldn't sign in

            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UITabBarController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
            
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

