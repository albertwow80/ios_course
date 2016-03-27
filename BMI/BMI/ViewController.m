//
//  ViewController.m
//  BMI
//
//  Created by 訪客使用者 on 2016/3/4.
//  Copyright (c) 2016年 訪客使用者. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Excute:(id)sender {
    float h =[[self.high text] floatValue]/100;
    float w =[[self.weight text] floatValue];
    float bmi = w/(h*h);
    self.BMI.text = [NSString stringWithFormat:@"%.2f",bmi];
    if(bmi<18.5){
        self.result.text = [NSString stringWithFormat:@"過輕"];
        self.result.textColor = [UIColor redColor];
    }
    else if(bmi<24){
        self.result.text = [NSString stringWithFormat:@"剛剛好"];
        self.result.textColor = [UIColor blackColor];
    }
    else{
        self.result.text = [NSString stringWithFormat:@"過重"];
        self.result.textColor = [UIColor redColor];
    }
    
    
}

@end
