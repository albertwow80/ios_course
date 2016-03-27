//
//  PlayingCard.h
//  Lecture2
//
//  Created by cg on 14/3/4.
//  Copyright (c) 2014年 cg. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end