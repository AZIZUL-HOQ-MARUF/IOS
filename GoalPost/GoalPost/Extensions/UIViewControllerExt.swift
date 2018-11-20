//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/10/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit
extension UIViewController{
    func presentDetail(_ viewController : UIViewController){
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 0.3
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition , forKey: kCATransition)
        present(viewController , animated: false , completion: nil)
        
    }
    
    func presentSecondaryDetails(_ viewController : UIViewController){
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 0.3
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let currenPresentedViewController = presentedViewController else { return}
        currenPresentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition , forKey: kCATransition)
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    func dismissDetail(){
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 0.3
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition , forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
