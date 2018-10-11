//
//  ViewController.h
//  SystemPreferences
//
//  Created by mac-lab on 9/29/18.
//  Copyright © 2018 maruf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) IBOutlet UITextField *textFieldOne;
- (IBAction)saveAction:(UIButton *)sender;

@end

