//
//  TextStatsViewController.m
//  TextArtibutor
//
//  Created by albert on 2016/4/1.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactersLabel;

@end



@implementation TextStatsViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}


-(void)setTextToAnlyze:(NSAttributedString *)textToAnlyze
{
    _textToAnlyze = textToAnlyze;
    if (self.view.window) {
        [self updateUI];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI
{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters",(unsigned long)[[self characterWithAttribute:NSForegroundColorAttributeName] length]];
    
    
    self.outlineCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters",(unsigned long)[[self characterWithAttribute:NSStrokeWidthAttributeName] length]];
}
-(NSAttributedString *)characterWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index =0;
    
    while (index<[self.textToAnlyze length]) {
        
        NSRange range;
        id value = [self.textToAnlyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnlyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;
        }
    }
    
    
    return characters;
}

@end
