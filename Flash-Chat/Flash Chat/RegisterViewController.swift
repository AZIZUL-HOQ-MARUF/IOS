//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController,UITextFieldDelegate {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield!.delegate = self
        passwordTextfield!.delegate = self
        //Using UITapGestureRecognizer to hide Keyboard by touch outside the fields
        let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func touched(){
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()

     if self.emailTextfield.text! != "" && self.passwordTextfield.text! != ""{
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                if error?.localizedDescription == "The email address is already in use by another account."{
                    let alert = UIAlertController.init(title: "Error", message: "Email Already exist!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Ok", style: .default , handler: nil))
                    self.present(alert , animated: true ,completion: nil)
                }
                
                if self.passwordTextfield.text!.count < 6{
                    let alert = UIAlertController.init(title: "Error", message: "Password should be at least 6 characters!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "Ok", style: .default , handler: nil))
                    self.present(alert , animated: true ,completion: nil)
                    
                }
                else{
//                print(error!)
                let alert = UIAlertController.init(title: "Error", message: "Registration Failed!", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default , handler: nil))
                self.present(alert , animated: true ,completion: nil)
                
                }
            }
            else{
                //success
                SVProgressHUD.dismiss()
                
                let alert = UIAlertController.init(title: "Success", message: "Registration Successfull!", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }))
                self.present(alert , animated: true ,completion: nil)
                
            }
        
        }
    }
    
     else{
        let alert = UIAlertController.init(title: "Error", message: "Please Fill up All the Fields!", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default , handler: nil))
        self.present(alert , animated: true ,completion: nil)
        }
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
