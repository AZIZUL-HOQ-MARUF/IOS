//
//  ViewController.swift
//  Registration
//
//  Created by Azizul Hoq on 10/2/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var name: UITextField!
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var phone: UITextField!
    
    //configure Database
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set up text field delegates
        name!.delegate=self
        email!.delegate=self
        phone!.delegate=self
        
        //Using UITapGestureRecognizer to hide Keyboard by touch outside the fields
        let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
        self.view.addGestureRecognizer(tap)
    }
    @objc func touched(){
        self.view.endEditing(true)
    }


    @IBAction func reg(_ sender: UIButton) {
        if name?.text != "" && email?.text != "" && phone?.text != ""{
            
            //Insert Data into Ap_Rec Table
            let newuser = NSEntityDescription.insertNewObject(forEntityName: "Ap_Rec", into: context)
            newuser.setValue(self.name!.text, forKey: "name")
            newuser.setValue(self.email!.text, forKey: "e_mail")
            newuser.setValue(Int(self.phone.text!), forKey: "phone_Number")
            
            do{
                //Insert Operation
                try context.save()
            }
            catch{
                
            }
            //Clearing Fields for new Input
            name!.text = ""
            email!.text = ""
            phone!.text = ""
            
        }
        else{
            //UIAlertController
            let alert = UIAlertController(title: "Alert", message: "Please fill up All fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
   //Enable the return key to hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

