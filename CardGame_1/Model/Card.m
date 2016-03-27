//
//  Card.m
//  Lecture2
//
//  Created by cg on 14/3/4.
//  Copyright (c) 2014年 cg. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1; }
    }
    return score;
}

@end
