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
    
    
    /*
     global variables and properties initialization
    */
    
    //variable for storing first input
    data1=0;
    
    //variable for storing second input
    data2=0;
    
    //variable for storing result
    result=0;
    
    //BOOL
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
    
    //reset the label text
    _label.text=@"0";
    
    //reset the first input variable
    data1=0;
    
    //reset the first input variable
    data2=0;
    
}


//plus-minus button action METHOD
- (IBAction)pmButton:(UIButton *)sender {
    _labelStr=@"-";
    
    //appending a minus(-) left to the label text
    _label.text=[_labelStr stringByAppendingString:_label.text];
    
    
    
}


//percent button action METHOD
- (IBAction)percent:(UIButton *)sender {
    
    //taking the only input and converting string to double
    data1=[_label.text doubleValue];
    
    //finding out the percentage
    data1=data1/100.00;
    
    
    //setting the result to the label
    _label.text=[NSString stringWithFormat:@"%.2lf",data1];
    
    //reset the first input variable.
    data1=0;
}


//plus button action METHOD
- (IBAction)plusButton:(UIButton *)sender {
    
    //setting number value =1 for switch plus calculation.
    numOperator=1;
    
    
    /*as we wanted, First value will be removed and will start showing the second input while start taking the second input.
     
     Before removing first value, the first value will be stored in first input variable (data1).
     
     this is a math operator action method. when a math operator will be tapped, BOOL flag value will YES.
     
     if, flag value is YES then calculator will start taking second input.
     
    */
    
    flag=YES;
    
    
    
    /*taking label text into labelStr to convert the string to double value.
      because we can't do calculation with string value.
     */
    
     _labelStr=_label.text;
    
    
    //data1 is the first user input
    
    /*it will store a double value which is converted from
      the NSString object labelStr.
    */
    
    data1=[_labelStr doubleValue];
    
}


//one button action METHOD
- (IBAction)oneButton:(UIButton *)sender {
    
    /*initialy label value is 0, and concatenating a new value with previous.
     we don't want to concatenate new value with previous only zero(0) .
     so, if label's current only value is zero we are going to remove that zero.
     */
    if([_label.text isEqual:@"0"]){
        _label.text=@"";
    }
    
    /*
     if flag value=YES, that means any of math Operator has tapped and
     first input has taken.
     Now, calculator is ready to take the second input .
     
     as we wanted, First value will be removed and will start showing the second input while start taking the second value.
     
     after removing label text we will set flag to NO so that user can input data continiously.
     if we do not set flag to NO each number input will be deleted and do not append with previous number.
     
     */
    if(flag){
        _label.text=@"";
        flag=NO;
    }
    //appending 1 at the right of the label text
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
    //appending 2 at the right of the label text
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
    //appending 3 at the right of the label text
    _label.text=[_label.text stringByAppendingString:@"3"];
    
}


//minus button action METHOD
- (IBAction)minusButton:(UIButton *)sender {
    //setting number value =2 for switch minus calculation
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
    //appending 4 at the right of the label text
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
    //appending 5 at the right of the label text
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
    //appending 6 at the right of the label text
    _label.text=[_label.text stringByAppendingString:@"6"];
    
}


//multi button action METHOD
- (IBAction)multiButton:(UIButton *)sender {
    
    //setting number value =3 for switch multiply calculation
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
    //appending 7 at the right of the label text
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
    //appending 8 at the right of the label text
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
    //appending 9 at the right of the label text
    _label.text=[_label.text stringByAppendingString:@"9"];
    
    
    
}


//div button action METHOD
- (IBAction)divButton:(UIButton *)sender {
    
    //setting number value =4 for switch division calculation
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
    //appending 0 at the right of the label text
    _label.text=[_label.text stringByAppendingString:@"0"];
    
}


//dot button action METHOD
- (IBAction)dotButton:(UIButton *)sender {
    /*initialy label value is 0, and concatenating a new value with previous.
     we don't want to concatenate new value with previous only zero(0) .
     so, if label's current only value is zero we are going to remove that zero.
     */
    
    /*
     we know that if flag=YES then, program will remove all label text
     before taking new input.
     this method will append a dot(.) at the end of String.
     but if, label text =="" before append dot(.) we want a zero(0) before
     the dot(.)
     */
    if(flag){
        _label.text=@"0";
        flag=NO;
    }
    //appending dot(.) at the right of the label text
    _label.text=[_label.text stringByAppendingString:@"."];
    
}


//equal button action METHOD
- (IBAction)equalButton:(UIButton *)sender {
    
    /*
     if flag=NO that means any of number buttons has tapped or any of button hasn't tapped yet.
     
     if flag=NO we'll start calculating
     */
    if(flag==NO){
        
        //current label value storing to a string object
        _labelStr=_label.text;
        
        //converting string to double and storing into second input variable.
        data2=[_labelStr doubleValue];
        [self getCalculation:numOperator];

    }
    flag=YES;
}

//getCalculation method culculate numbers

-(void)getCalculation:(int)a{
    
    switch (a) {
        case 1:
            
            //Adding (Calculating) two input to result variable
            result=data1+data2;
            
            //Showing Result to the Label
            _label.text=[NSString stringWithFormat:@"%.1lf",result];
            
            //After showing result reseting variables
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
