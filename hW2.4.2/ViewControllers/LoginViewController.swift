//
//  ViewController.swift
//  hW2.4.2
//
//  Created by Алексей Трофимов on 31.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userName = "User"
    let password = "1234"
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextFied: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        nameTextField.text = ""
        passwordTextFied.text = ""
    }
    
    @IBAction func forgotPasswordButton() {
        alertAction(title: "OOOps", message: "1234")
        passwordTextFied.text = ""
    }
    @IBAction func forgotNameButton() {
        alertAction(title: "OOOps", message: "User")
        nameTextField.text = ""
    }
    
    @IBAction func logInButton() {
        if nameTextField.text != userName {
            alertAction(title: "OOOps", message: "Неверное имя")
            nameTextField.text = ""
        } else if passwordTextFied.text != password {
            alertAction(title: "OOOps", message: "Неверный пароль")
            passwordTextFied.text = ""
        }
        performSegue(withIdentifier: "", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let userDetailsVC = tabBarController.viewControllers?.first as! UserDetailsViewController
        userDetailsVC.userNameDVC = nameTextField.text
    }
    func alertAction (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextFied.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}
