//
//  GoalCell.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/3/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet var goalDescription: UILabel!
    
    @IBOutlet var typeDescriptionLbl: UILabel!
    
    @IBOutlet var goalAmount: UILabel!
    
    @IBOutlet weak var goalCompleteView: UIView!
    
    func setupCellValue(goal : GoalPost){
        self.goalDescription.text = goal.goalDescription
        self.typeDescriptionLbl.text = goal.typeDescription
        self.goalAmount.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.completionValue {
            self.goalCompleteView.isHidden = false
        }
        else{
           self.goalCompleteView.isHidden = true
        }
    }

}
