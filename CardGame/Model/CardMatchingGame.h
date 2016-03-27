//
//  CardMatchingGame.h
//  CardGame
//
//  Created by albert on 2016/3/18.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

@property (nonatomic,readonly)NSInteger score;
-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;
-(void)chooseCardatIndex:(NSUInteger)index;
-(Card *) cardAtIndex:(NSUInteger)index;





@end
