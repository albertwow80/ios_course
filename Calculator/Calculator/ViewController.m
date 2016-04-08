//
//  ViewController.m
//  Calculator
//
//  Created by albert on 2016/4/8.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   operatorPressed = FALSE;
   show = FALSE;
   firstEntry = NULL;
   secondEntry= NULL;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clear:(id)sender {
    operatorPressed = FALSE;
    _labelOutput.text = [NSString stringWithFormat:@"0"];
    _showlabel.text = [NSString stringWithFormat:@"0"];
    firstEntry = NULL;
    secondEntry = NULL;
    op = 0;
}

- (IBAction)add:(id)sender {
    op=1;
    operatorPressed = TRUE;
}

- (IBAction)sub:(id)sender {
    op=2;
    operatorPressed = TRUE;

}

- (IBAction)mul:(id)sender {
    op = 3;
    operatorPressed = TRUE;

}

- (IBAction)div:(id)sender {
    op = 4;
    operatorPressed = TRUE;
}
- (IBAction)hun:(id)sender {
    op = 5;
    operatorPressed = TRUE;
}
- (IBAction)pdivs:(id)sender {
    op  = 6;
    operatorPressed = TRUE;
}



- (IBAction)equals:(id)sender {
    switch (op){
        case 1:{
            int outPutNum  = [firstEntry intValue]+[secondEntry intValue];
            _labelOutput.text = [NSString stringWithFormat:@"%i",outPutNum];
            _showlabel.text = [NSString stringWithFormat:@"0"];
        }
            break;
        case 2:{
            int outPutNum  = [firstEntry intValue]-[secondEntry intValue];
            _labelOutput.text = [NSString stringWithFormat:@"%i",outPutNum];
            _showlabel.text = [NSString stringWithFormat:@"0"];
        }
            break;
        case 3:{
            float outPutNum  = (float)[firstEntry intValue]*(float)[secondEntry intValue];
            _labelOutput.text = [NSString stringWithFormat:@"%f",outPutNum];
            _showlabel.text = [NSString stringWithFormat:@"0"];
        }
            
            break;
        case 4:{
           float outPutNum  = (float)[firstEntry intValue]/(float)[secondEntry intValue];
            _labelOutput.text = [NSString stringWithFormat:@"%f",outPutNum];
            _showlabel.text = [NSString stringWithFormat:@"0"];
        }
            
            break;
        default:
            break;
    }
    op = 0;
    operatorPressed = FALSE;
    firstEntry = NULL;
    secondEntry= NULL;
    
}
-(IBAction)number:(UIButton *)sender{
    int tag = sender.tag;
    float tag_hun = 0;
        if (operatorPressed ==FALSE) {
            if (firstEntry == NULL) {
                firstEntry = [NSString stringWithFormat:@"%i",tag];
                _showlabel.text = [NSString stringWithFormat:@"%i",tag];
                _labelOutput.text = firstEntry;
                switch (op) {
                    case 5:{
                        tag = -1*tag;
                        firstEntry = [NSString stringWithFormat:@"%i",tag];
                        _showlabel.text = [NSString stringWithFormat:@"%i",tag];
                        _labelOutput.text = firstEntry;
                    }
                       
                        break;
                    case 6:{
                        tag_hun = tag/100;
                        firstEntry = [NSString stringWithFormat:@"%f",tag_hun];
                        _showlabel.text = [NSString stringWithFormat:@"%i",tag];
                        _labelOutput.text = firstEntry;
                    }
                        break;
                    default:
                        break;
                }
            }
            else{
                firstEntry = [NSString stringWithFormat:@"%@%i",firstEntry,tag];
                
                _labelOutput.text = firstEntry;
                _showlabel.text = firstEntry;
            }
        }
        else{
            if (secondEntry == NULL) {
                secondEntry = [NSString stringWithFormat:@"%i",tag];
                switch (op) {
                    case 1:
                        _showlabel.text = [NSString stringWithFormat:@"%@ + %i",firstEntry,tag];
                        break;
                    case 2:
                        _showlabel.text = [NSString stringWithFormat:@"%@ - %i",firstEntry,tag];
                        break;
                    case 3:
                        _showlabel.text = [NSString stringWithFormat:@"%@ × %i",firstEntry,tag];
                        break;
                    case 4:
                        _showlabel.text = [NSString stringWithFormat:@"%@ ÷ %i",firstEntry,tag];
                        break;
                    case 5:
                        //_showlabel.text = [NSString stringWithFormat:@"%@ %% %i",firstEntry,tag];
                        break;
                    case 6:
                        
                        break;
                    default:
                        break;
                }
                _labelOutput.text = secondEntry;
            }
            else{
                secondEntry = [NSString stringWithFormat:@"%@%i",secondEntry,tag];
                switch (op) {
                    case 1:
                        _showlabel.text = [NSString stringWithFormat:@"%@ + %@%i",firstEntry,secondEntry,tag];
                        break;
                    case 2:
                        _showlabel.text = [NSString stringWithFormat:@"%@ - %@%i",firstEntry,secondEntry,tag];
                        break;
                    case 3:
                        _showlabel.text = [NSString stringWithFormat:@"%@ × %@%i",firstEntry,secondEntry,tag];
                        break;
                    case 4:
                        _showlabel.text = [NSString stringWithFormat:@"%@ ÷ %@%i",firstEntry,secondEntry,tag];
                        break;
                    case 5:
                        //_showlabel.text = [NSString stringWithFormat:@"%@ %% %i",firstEntry,tag];
                        break;
                    default:
                        break;
                }
                _labelOutput.text = secondEntry;
            }
        }
    
}
@end
