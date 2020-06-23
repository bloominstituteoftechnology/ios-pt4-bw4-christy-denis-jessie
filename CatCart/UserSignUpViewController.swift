//
//  UserSignUpViewController.swift
//  CatCart
//
//  Created by Jessie Ann Griffin on 6/17/20.
//  Copyright © 2020 CatCartCo. All rights reserved.
//

import UIKit

class UserSignUpViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    var userController: UserController?
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @IBAction func showLogin() {
        let loginVC = UserLoginViewController.newLogin()
        loginVC.currentUser = currentUser
        present(loginVC, animated: true, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: UIButton) {

        guard let userController = userController else { return }

        if let userEmail = userEmailTextField.text,
            !userEmail.isEmpty,
            let password = userPasswordTextField.text,
            !password.isEmpty {
            

            let user = UserRepresentation(password: password,
                                          userName: userEmail)
            
            currentUser = User(userName: user.userName,
                               password: user.password,
                               firstName: nil,
                               lastName: nil,
                               email: nil,
                               longitude: nil,
                               latitude: nil,
                               streetAddress: nil,
                               city: nil,
                               state: nil,
                               zipCode: nil)
            
            userController.signUp(with: user) { error in
                
                if let error = error {
                    
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(
                            title: "Sign Up Successfull",
                            message: "Now please log in.",
                            preferredStyle: .alert)
                        let alertAction = UIAlertAction(
                            title: "OK",
                            style: UIAlertAction.Style.default,
                            handler: { action -> Void in
                                self.showLogin()
                        })
                        
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true)
                        self.userEmailTextField.text = ""
                        self.userPasswordTextField.text = ""
                    }
                    print("Error did not occur during sign up: \(error)")
                    
                } else {
                    DispatchQueue.main.async {
                        self.userEmailTextField.text = ""
                        self.userPasswordTextField.text = ""
                        
                        let alertController = UIAlertController(
                            title: "Sign Up not Successfull",
                            message: "Username already exists, please try again.",
                            preferredStyle: .alert)
                        let alertAction = UIAlertAction(
                            title: "OK",
                            style: UIAlertAction.Style.default,
                            handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true)
                        
                    }
                }
            }
            
        }
    }
    
     //MARK: - Navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "ToLoginFromCreate" {
                 if let signInVC = segue.destination as? UserLoginViewController {
                    signInVC.currentUser = self.currentUser
                 }
             }
         }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
