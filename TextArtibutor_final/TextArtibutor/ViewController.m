//
//  ViewController.m
//  TextArtibutor
//
//  Created by albert on 2016/3/25.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headLine;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outLineButton;

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnlyze = self.body.textStorage;
        }
    }
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outLineButton.currentTitle];
    
    [title addAttributes:@{NSStrokeWidthAttributeName:@-3,
                           NSStrokeColorAttributeName:self.outLineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    
    [self.outLineButton setAttributedTitle:title forState:UIControlStateNormal];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Change text Color
- (IBAction)changeBodyColor:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}
- (IBAction)outLine {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,NSStrokeColorAttributeName:[UIColor blackColor]} range:self.body.selectedRange];
}
- (IBAction)unOutLine {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(preferredFontsChanges:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)preferredFontsChanges:(NSNotification *)notification{
    [self   usePreferredFonts];
}
-(void)usePreferredFonts{
    self.body.font = [UIFont
                      preferredFontForTextStyle:UIFontTextStyleBody];
    self.headLine.font = [UIFont
                          preferredFontForTextStyle:UIFontTextStyleSubheadline];
}





@end
