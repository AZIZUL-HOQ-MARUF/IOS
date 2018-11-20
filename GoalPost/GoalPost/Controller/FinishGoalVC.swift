//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/17/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var pointsTextField: UITextField!
    
    
    var goalDescription : String!
    var goalType : GoalType!
    
    
    
    func initData(description:String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self

        createGoalBtn.bindToKeyboard()
    }
    

    @IBAction func CreateGoalAction(_ sender: UIButton) {
        
        //pass data to core data model
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        
    
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissDetail()
    }
    
    func save( completion: (_ finished :Bool) ->() ){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return  }
        let goal = GoalPost(context: managedContext)
        goal.goalDescription = goalDescription
        goal.typeDescription = goalType.rawValue
        goal.completionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
            print("Saved Successfully")
        }
        catch{
            completion(false)
            debugPrint("Error occured While Saving Data : \(error.localizedDescription)")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
