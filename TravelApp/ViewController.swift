//
//  ViewController.swift
//  TravelApp
//
//  Created by SEVVAL on 2.11.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            showTableViewVC()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //showTableViewVC()
    }
    


    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != nil && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.showTableViewVC()
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Email/Password?")
        }
        
        
    }
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.showTableViewVC()
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Email/Password?")
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showTableViewVC() {
        let viewController = TableViewController.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

