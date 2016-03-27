//
//  CardMatchingGame.m
//  CardGame
//
//  Created by albert on 2016/3/18.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic,strong)NSMutableArray *cards;
@end



@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    //must always call our superclass’s designated initializer
    self = [super init];
    if(self){
        for (int i=0; i<count; i++) {
            Card *thisCard = [deck drawRandomCard];
            if (thisCard) {//adding nil to array will crash
                [self.cards addObject:thisCard];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return self.cards[index];
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;



-(void) chooseCardatIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]]; // if contents are the same, return 1
                    if (matchScore) {
                        self.score +=matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
