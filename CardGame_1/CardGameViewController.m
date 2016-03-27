//
//  CardGameViewController.m
//  CardGame
//
//  Created by 訪客使用者 on 2016/3/11.
//  Copyright (c) 2016年 albert. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"



@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;
@property (strong,nonatomic) CardMatchingGame *game;
@end



@implementation CardGameViewController

//inital card
- (Deck* )createDeck{
    return [[PlayingCardDeck    alloc] init];
}

- (IBAction)clickCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButton indexOfObject:sender];
    [self.game chooseCardatIndex:chosenButtonIndex];
    [self updateUI];

}
-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:[self createDeck]];
    }
    return _game;
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButton) {
        NSUInteger cardButtonIndex = [self.cardButton indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageforCard:card] forState:UIControlStateNormal];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:[self titleForCard:card]];
        if (image) {
            [cardButton setBackgroundImage:image forState:UIControlStateNormal];
            [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
            [[cardButton titleLabel] setFont:[UIFont systemFontOfSize:10]];
            [cardButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            [cardButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        }
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Sorce %ld",(long)self.game.score];
    }
    
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}
-(UIImage *)backgroundImageforCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
