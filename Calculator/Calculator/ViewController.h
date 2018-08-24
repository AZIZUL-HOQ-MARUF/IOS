//
//  ViewController.h
//  Calculator
//
//  Created by Azizul Hoq on 8/22/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Display Label
@property (weak, nonatomic) IBOutlet UILabel *label;


//C button with action method
@property (weak, nonatomic) IBOutlet UIButton *cButton;
- (IBAction)cButton:(UIButton *)sender;


//plus minus button with action method
@property (weak, nonatomic) IBOutlet UIButton *pmButton;
- (IBAction)pmButton:(UIButton *)sender;


//percent button with action method
@property (weak, nonatomic) IBOutlet UIButton *percent;
- (IBAction)percent:(UIButton *)sender;


//plus button with action method
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
- (IBAction)plusButton:(UIButton *)sender;


//one button with action method
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
- (IBAction)oneButton:(UIButton *)sender;


//two button with action method
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
- (IBAction)twoButton:(UIButton *)sender;


//three button with action method
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
- (IBAction)threeButton:(UIButton *)sender;


//minus button with action method
@property (weak, nonatomic) IBOutlet UIButton *minusButon;
- (IBAction)minusButton:(UIButton *)sender;


//four button with action method
@property (weak, nonatomic) IBOutlet UIButton *fourButton;
- (IBAction)fourButton:(UIButton *)sender;


//five button with action method
@property (weak, nonatomic) IBOutlet UIButton *fiveButton;
- (IBAction)fiveButton:(UIButton *)sender;


//six button with action method
@property (weak, nonatomic) IBOutlet UIButton *sixButton;
- (IBAction)sixButton:(UIButton *)sender;


//multiply button with action method
@property (weak, nonatomic) IBOutlet UIButton *multiButton;
- (IBAction)multiButton:(UIButton *)sender;


//seven button with action method
@property (weak, nonatomic) IBOutlet UIButton *sevenButton;
- (IBAction)sevenButton:(UIButton *)sender;


//eight button with action method
@property (weak, nonatomic) IBOutlet UIButton *eightButton;
- (IBAction)eightButton:(UIButton *)sender;


//nine button with action method
@property (weak, nonatomic) IBOutlet UIButton *nineButton;
- (IBAction)nineButton:(UIButton *)sender;


//div button with action method
@property (weak, nonatomic) IBOutlet UIButton *divButton;
- (IBAction)divButton:(UIButton *)sender;


//zero button with action method
@property (weak, nonatomic) IBOutlet UIButton *zeroButton;
- (IBAction)zeroButton:(UIButton *)sender;


//C button with action method
@property (weak, nonatomic) IBOutlet UIButton *dotButton;
- (IBAction)dotButton:(UIButton *)sender;


//equal button with action method
@property (weak, nonatomic) IBOutlet UIButton *equlButton;
- (IBAction)equalButton:(UIButton *)sender;


@end

