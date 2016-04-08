//
//  ViewController.h
//  Calculator
//
//  Created by albert on 2016/4/8.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    bool operatorPressed;
    bool show;
    bool add;
    int  op;
    int count;
    NSString *firstEntry;
    NSString *secondEntry;
}


@property (strong, nonatomic) IBOutlet UILabel *labelOutput;
@property (strong, nonatomic) IBOutlet UILabel *showlabel;

- (IBAction)clear:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)sub:(id)sender;
- (IBAction)mul:(id)sender;
- (IBAction)div:(id)sender;
- (IBAction)pdivs:(id)sender;
- (IBAction)hun:(id)sender;




- (IBAction)equals:(id)sender;



-(IBAction)number:(UIButton *)sender;








@end

