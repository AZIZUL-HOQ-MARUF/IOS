//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework

class ChatViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    // Declare instance variables here
    var messagesArray : [Message] = [Message]()
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //TODO: Set yourself as the delegate and datasource here:
        self.messageTableView!.delegate = self
        self.messageTableView!.dataSource = self
        
        //TODO: Set yourself as the delegate of the text field here:

        self.messageTextfield!.delegate = self
        
        //TODO: Set the tapGesture here:
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        self.view.addGestureRecognizer(tap)
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib (nibName: "MessageCell", bundle: nil), forCellReuseIdentifier:"customMessageCell" )
        
        configureTableView()
        retrieveMessages ()
        self.messageTableView.separatorStyle = .none
        
    }
    
    

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        cell.messageBody.text = messagesArray[indexPath.row].message
        cell.senderUsername.text = messagesArray[indexPath.row].sender
        
        let msg = "\n" + cell.messageBody.text!
       
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email{
            cell.messageBody.text = msg
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
            cell.senderUsername.text = ""
          
            cell.messageBody.textAlignment = .right
            cell.messageBody.textColor = UIColor.white
            
            
            //        code for avatar image
            cell.avatarImageView.image =  UIImage(named:"")
            //cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.size.width / 2
                    cell.avatarImageView.layer.borderWidth = 0
            //        cell.avatarImageView.layer.borderColor = UIColor.blue.cgColor
            //        cell.avatarImageView.clipsToBounds = true
            //adding custom message Colour
            
        }
        else{
            cell.messageBackground.backgroundColor = UIColor.flatWhite()
            cell.messageBody.textColor = UIColor.flatBlack()
            
            //code for avatar image
            cell.avatarImageView.image =  UIImage(named:"Avatar-16")
            cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.size.width / 2
            cell.avatarImageView.layer.borderWidth = 1.5
            cell.avatarImageView.layer.borderColor = UIColor.blue.cgColor
            cell.avatarImageView.clipsToBounds = true
            
            cell.messageBody.sizeToFit()
            cell.messageBody.textAlignment = .left
        }
        
        
        
        
        
        return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped(){
        self.view.endEditing(true)
    }
    
    
    //TODO: Declare configureTableView here:
    func configureTableView(){
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
        
    }
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.2){
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    //TODO: Declare textFieldShouldReturn here:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        if messageTextfield.text != ""{
        
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        let messageDB = Database.database().reference().child("message")
        let messageDictionary = ["sender" : Auth.auth().currentUser?.email,
                                 "messageBody" : messageTextfield.text!]
        messageDB.childByAutoId().setValue(messageDictionary){
            (error, reference) in
            if error != nil {
                let alert = UIAlertController(title: "Failed", message: "Message Sending Failed!", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            }
            else{
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text! = ""
            }
        }
            
        }
        
    }
    
    //TODO: Create the retrieveMessages method here:
    func retrieveMessages (){
        SVProgressHUD.show()
        let messagesDb = Database.database().reference().child("message")
        messagesDb.observe(.childAdded) { (snapShot) in
            let snapValue = snapShot.value as! Dictionary<String,String>
            
            let text = snapValue["messageBody"]!
            let sender = snapValue["sender"]!
            
            let message = Message()
            message.message = text
            message.sender = sender
            
            
            self.messagesArray.append(message)
            self.configureTableView()
            SVProgressHUD.dismiss()
            self.messageTableView.reloadData()
            self.scrollToBottom()
        }
    }
    
 
        
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        SVProgressHUD.show()
        do{
            try Auth.auth().signOut()
            SVProgressHUD.dismiss()
            performSegue(withIdentifier: "goToHome", sender: self)
        }
        catch{
            let alert = UIAlertController.init(title: "Error", message: "SignOut failed!\nCheck Your Internet Connection! ", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //MARK: - scrolling to bottom of the tableView
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messagesArray.count-1, section: 0)
            self.messageTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }


}
