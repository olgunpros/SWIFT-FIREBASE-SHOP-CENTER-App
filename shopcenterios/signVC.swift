//
//  signVC.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class signVC: UIViewController {
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var password2Text: UITextField!
    @IBOutlet var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signClicked(_ sender: Any) {
        if emailText != nil && passwordText != nil && password2Text! == nil && passwordText.text == password2Text.text {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { result , error in
                
                if error != nil {
                    self.makeAlert(text: error?.localizedDescription ?? "Error!")
                    
                }else {
                    
                    self.performSegue(withIdentifier: "girildiVC", sender: nil)
                }
                
                
            }
            
            
            
        }
        else {
            self.makeAlert(text: "Please check Email and Password Labels :)")
        }
        
        
    }
    func makeAlert(text : String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
  

}
