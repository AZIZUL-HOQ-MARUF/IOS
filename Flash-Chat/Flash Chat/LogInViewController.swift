//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import  Firebase
import SVProgressHUD
class LogInViewController: UIViewController,UITextFieldDelegate {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield!.delegate=self
        passwordTextfield!.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
        self.view.addGestureRecognizer(tap)
    
    }
    @objc func touched() {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
   
    @IBAction func logInPressed(_ sender: AnyObject) {

        SVProgressHUD.show()
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if self.emailTextfield.text! != "" && self.passwordTextfield.text! != ""{
            if error != nil {
                let alert = UIAlertController.init(title: "Login Failed", message: "Username or Password Incorrect! ", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                //success
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
            else{
                let alert = UIAlertController.init(title: "Blank Feilds!", message: "Username or Password Field is Blanked! ", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
       return true
    }
    


    
}  
