//
//  ViewController.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/3/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate


class GoalsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var goals:[GoalPost] = []
    
    
    // MARK : -
    override func viewDidLoad() {
        super.viewDidLoad()
        //let goal = GoalPost()
        tableView.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    // MARK : -viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    
    // MARK : - fetchCoreDataObjects
    
    func fetchCoreDataObjects(){
        
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1{
                    tableView.isHidden = false
                    
                }
                else{
                    tableView.isHidden = true
                }
                
            }
        }
    }
    
    //
    
    func setProgress(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        
        let choosenGoal = goals[indexPath.row]
        if choosenGoal.goalProgress < choosenGoal.completionValue {
            choosenGoal.goalProgress = choosenGoal.goalProgress + 1
        }
        else{
            return
        }
        do{
            try managedContext.save()
        }
        catch{
            debugPrint("Error occured while setting Progreess !\(error.localizedDescription)")
        }
    }

    // MARK : - addBtton
    @IBAction func addBtton(_ sender: UIButton) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            return
        }
        presentDetail(createGoalVC)
    }
    
}


extension GoalsVC:UITableViewDelegate,UITableViewDataSource{
    
    
    // MARK : - TableView heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // MARK : - TableView numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    // MARK : - TableView cellForRowAt indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let goal = goals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as! GoalCell
        
        cell.setupCellValue(goal: goal)
        
        return cell
    }
    
    // MARK : - TableView canEditRowAt indexPath:
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK : - TableView editingStyleForRowAt
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // MARK : - TableView EditActionsForRowAt indexPath
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeData(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.0009090139614, green: 0.3201340419, blue: 0.001410417927, alpha: 1)
        return [deleteAction , addAction]
    }
    
    
    // MARK : - CoreData Fetching Data
    
    func fetch ( completion : (_ complete : Bool)-> ()){
        
        guard let manageContext = appDelegate?.persistentContainer.viewContext else{return}
        let fetchRequest = NSFetchRequest<GoalPost>(entityName: "GoalPost")
        do{
            goals = try manageContext.fetch(fetchRequest)
            //print(goals)
            completion(true)
        }
        catch{
            debugPrint("Error occured \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    // MARK : - CoreData Remove Data
    
    func removeData(atIndexPath indexPath: IndexPath){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goals[indexPath.row])
        
        do{
            try managedContext.save()
            debugPrint("data Deleted Successfully!")
        }
        catch{
            //fatalError("Error Occured while deleting data \(error.localizedDescription)")
        }
        
    }
    
    
}

