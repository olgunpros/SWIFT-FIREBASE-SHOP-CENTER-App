//
//  loginVC.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class loginVC: UIViewController {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var rememberMeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")
        rememberMeSwitch.isOn = rememberMe
        
        if rememberMe {
            if let email = UserDefaults.standard.string(forKey: "userEmail"),
               let password = UserDefaults.standard.string(forKey: "userPassword") {
                emailText.text = email
                passwordText.text = password
                
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if error == nil {
                        self.performSegue(withIdentifier: "girildiVC", sender: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "rememberMe")
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text, !email.isEmpty, !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.makeAlert(text: error?.localizedDescription ?? "Error")
                } else {
                    if self.rememberMeSwitch.isOn {
                        UserDefaults.standard.set(email, forKey: "userEmail")
                        UserDefaults.standard.set(password, forKey: "userPassword")
                    } else {
                        UserDefaults.standard.removeObject(forKey: "userEmail")
                        UserDefaults.standard.removeObject(forKey: "userPassword")
                    }
                    self.performSegue(withIdentifier: "girildiVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(text: "Please check Email and Password Labels :)")
        }
    }
    
    @IBAction func createClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tocreateVC", sender: nil)
    }
    
    func makeAlert(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
