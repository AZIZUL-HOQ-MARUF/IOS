//
//  ViewController.m
//  Calculator
//
//  Created by Azizul Hoq on 8/22/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    double data1,data2,result;
    int numOperator;
    BOOL flag;
}
    
@property (strong,nonatomic) NSString *labelStr;

-(void)getCalculation:(int) a;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //global variables and properties initialization
    data1=0;
    data2=0;
    result=0;
    flag=NO;
    
    //Initialing NSString object for storing label.text data
    _labelStr= [[NSString alloc] init];
    
    //setting up Default Label value Zero(0)
    _label.text=@"0";
    
    // setting up C button border corner and radius
    _cButton.layer.cornerRadius=16;
    _cButton.clipsToBounds=YES;
    
    
     // setting up pm button border corner and radius
    _pmButton.layer.cornerRadius=16;
    _pmButton.clipsToBounds=YES;
    
    
     // setting up percent button border corner and radius
    _percent.layer.cornerRadius=16;
    _percent.clipsToBounds=YES;
    
    
     // setting up plus button border corner and radius
    _plusButton.layer.cornerRadius=16;
    _plusButton.clipsToBounds=YES;
    
    
     // setting up one button border corner and radius
    _oneButton.layer.cornerRadius=16;
    _oneButton.clipsToBounds=YES;
    
    
     // setting up two button border corner and radius
    _twoButton.layer.cornerRadius=16;
    _twoButton.clipsToBounds=YES;
    
    
     // setting up three button border corner and radius
    _threeButton.layer.cornerRadius=16;
    _threeButton.clipsToBounds=YES;
    
    
     // setting up four button border corner and radius
    _fourButton.layer.cornerRadius=16;
    _fourButton.clipsToBounds=YES;
    
    
     // setting up five button border corner and radius
    _fiveButton.layer.cornerRadius=16;
    _fiveButton.clipsToBounds=YES;
    
    
     // setting up six button border corner and radius
    _sixButton.layer.cornerRadius=16;
    _sixButton.clipsToBounds=YES;
    
    
     // setting up seven button border corner and radius
    _sevenButton.layer.cornerRadius=16;
    _sevenButton.clipsToBounds=YES;
    
    
     // setting up eight button border corner and radius
    _eightButton.layer.cornerRadius=16;
    _eightButton.clipsToBounds=YES;
    
    
     // setting up nine button border corner and radius
    _nineButton.layer.cornerRadius=16;
    _nineButton.clipsToBounds=YES;
    
     // setting up minus button border corner and radius
    _minusButon.layer.cornerRadius=16;
    _minusButon.clipsToBounds=YES;
    
     // setting up multi button border corner and radius
    _multiButton.layer.cornerRadius=16;
    _multiButton.clipsToBounds=YES;
    
     // setting up division button border corner and radius
    _divButton.layer.cornerRadius=16;
    _divButton.clipsToBounds=YES;
    
    
     // setting up dot button border corner and radius
    _dotButton.layer.cornerRadius=16;
    _dotButton.clipsToBounds=YES;
    
     // setting up zero button border corner and radius
    _zeroButton.layer.cornerRadius=16;
    _zeroButton.clipsToBounds=YES;
    
    
     // setting up equal button border corner and radius
    _equlButton.layer.cornerRadius=16;
    _equlButton.clipsToBounds=YES;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//C button action METHOD
- (IBAction)cButton:(UIButton *)sender {
    _label.text=@"0";
    
}


//plus-minus button action METHOD
- (IBAction)pmButton:(UIButton *)sender {
}


//percent button action METHOD
- (IBAction)percent:(UIButton *)sender {
}


//plus button action METHOD
- (IBAction)plusButton:(UIButton *)sender {
    numOperator=1;
    flag=YES;
    
    _labelStr=_label.text;
    data1=[_labelStr doubleValue];
    
}


//one button action METHOD
- (IBAction)oneButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"1"];
}


//two button action METHOD
- (IBAction)twoButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"2"];
    
}


//three button action METHOD
- (IBAction)threeButton:(UIButton *)sender {
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"3"];
    
}


//minus button action METHOD
- (IBAction)minusButton:(UIButton *)sender {
    numOperator=2;
    flag=YES;
    
    _labelStr=_label.text;
    data1=[_labelStr doubleValue];
}


//four button action METHOD
- (IBAction)fourButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"4"];
    
}


//five  button action METHOD
- (IBAction)fiveButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"5"];
}


//six  button action METHOD
- (IBAction)sixButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"6"];
    
}


//multi button action METHOD
- (IBAction)multiButton:(UIButton *)sender {
    numOperator=3;
    flag=YES;
    
    _labelStr=_label.text;
    data1=[_labelStr doubleValue];
}


//seven button action METHOD
- (IBAction)sevenButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"7"];
    
}


//eight button action METHOD
- (IBAction)eightButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"8"];
    
}


//nine button action METHOD
- (IBAction)nineButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"9"];
    
    
    
}


//div button action METHOD
- (IBAction)divButton:(UIButton *)sender {
    numOperator=4;
    flag=YES;
    
    _labelStr=_label.text;
    data1=[_labelStr doubleValue];
}


//zero button action METHOD
- (IBAction)zeroButton:(UIButton *)sender {
    
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"0"];
    
}


//dot button action METHOD
- (IBAction)dotButton:(UIButton *)sender {
    if(flag){
        _label.text=@"0";
        flag=NO;
    }
    _label.text=[_label.text stringByAppendingString:@"."];
    
}


//equal button action METHOD
- (IBAction)equalButton:(UIButton *)sender {
    if(flag==NO){
        _labelStr=_label.text;
        data2=[_labelStr doubleValue];
        [self getCalculation:numOperator];

    }
    flag=YES;
}

//getCalculation method culculate numbers

-(void)getCalculation:(int)a{
    
    
    
    switch (a) {
        case 1:
            result=data1+data2;
            
            _label.text=[NSString stringWithFormat:@"%.1lf",result];
            result=0;
            data1=0;
            data2=0;
            break;
            
        case 2:
            result=data1-data2;
            _label.text=[NSString stringWithFormat:@"%.1lf",result];
            result=0;
            data1=0;
            data2=0;
            break;
            
        case 3:
            result=data1*data2;
            _label.text=[NSString stringWithFormat:@"%.1lf",result];
            result=0;
            data1=0;
            data2=0;
            break;
        
        case 4:
            result=data1/data2;
            _label.text=[NSString stringWithFormat:@"%.1lf",result];
            result=0;
            data1=0;
            data2=0;
            break;
        default:
            break;
    }
}
@end
