//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/10/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController , UITextViewDelegate{

    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var shortTerm: UIButton!
    
    @IBOutlet weak var longTerm: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextButton.bindToKeyboard()
        shortTerm.setSelectedColor()
        longTerm.setDeselectedColor()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func shotTermAction(_ sender: UIButton) {
        goalType = .shortTerm
        shortTerm.setSelectedColor()
        longTerm.setDeselectedColor()
    }
    @IBAction func longTermAction(_ sender: UIButton) {
        goalType = .longTerm
        longTerm.setSelectedColor()
        shortTerm.setDeselectedColor()
        
    }
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        if goalTextView.text != "" && goalTextView.text != "what is your goal?"{
            
            guard let finishVC = storyboard?.instantiateViewController(withIdentifier: "FinishVC") as? FinishGoalVC else {return }
            finishVC.initData(description: goalTextView.text!, type: goalType)
//            presentDetail(finishVC)
            presentingViewController?.presentSecondaryDetails(finishVC)
            
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
