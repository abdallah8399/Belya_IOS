//
//  SignUpController.swift
//  Belya1
//
//  Created by Abdallah Mohamed on 20/07/2022.
//

import UIKit
import Firebase

class SignUpController: UIViewController {

    @IBOutlet weak var Name_TF: UITextField!
    @IBOutlet weak var Password_TF: UITextField!
    
    @IBOutlet weak var Email_TF: UITextField!
    @IBOutlet weak var Phone_TF: UITextField!
    
    @IBAction func Profile_Pic(_ sender: Any) {
        
        let pic = UIImagePickerController()
            pic.sourceType = .photoLibrary
            pic.delegate = self
            pic.allowsEditing = true
            present(pic, animated: true)
    }
    
    
    @IBAction func ID_Pic(_ sender: Any) {
        let pic = UIImagePickerController()
        pic.sourceType = .photoLibrary
        pic.delegate = self
        pic.allowsEditing = true
        present(pic, animated: true)
    }
    
    @IBAction func Type_Toggle(_ sender: Any) {
    }
    @IBAction func Signup(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
        }
        else {
            
            // Create cleaned versions of the data
            let fullname = Name_TF.text!
            
            let password = Password_TF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = Email_TF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let phone = Phone_TF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                }
                else {
                    
                    // User was created successfully, now store the first name and last name

                    
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if Name_TF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Password_TF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Email_TF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Phone_TF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UITabBarController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}


extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
    // upload to firebase
}
    picker.dismiss(animated: true, completion: nil)

}

func imagePickerControllerDidCancel (_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
}
    
}


