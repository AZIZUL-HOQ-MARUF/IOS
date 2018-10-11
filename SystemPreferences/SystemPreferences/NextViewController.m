//
//  NextViewController.m
//  SystemPreferences
//
//  Created by mac-lab on 9/29/18.
//  Copyright © 2018 maruf. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *store =[NSUserDefaults standardUserDefaults];
    _nextLabel.text= [store objectForKey:@"displayText"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
