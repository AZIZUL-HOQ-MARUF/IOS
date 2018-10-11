//
//  ViewController.m
//  SystemPreferences
//
//  Created by mac-lab on 9/29/18.
//  Copyright © 2018 maruf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textFieldOne.delegate = self;
    
     NSUserDefaults *store =[NSUserDefaults standardUserDefaults];
    _displayLabel.text=[store objectForKey:@"displayText"];
    _textFieldOne.text=[store objectForKey:@"displayText"];
}


- (IBAction)saveAction:(UIButton *)sender {
    _displayLabel.text=_textFieldOne.text;
    
    //system preferece
    NSUserDefaults *store =[NSUserDefaults standardUserDefaults];
    [store setObject:_textFieldOne.text forKey:@"displayText"];
}



@end
