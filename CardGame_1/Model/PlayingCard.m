//
//  PlayingCard.m
//  Lecture2
//
//  Created by cg on 14/3/4.
//  Copyright (c) 2014年 cg. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//繼承card  改寫match
-(int)match:(NSArray *)otherCards{
    int source =0;
    PlayingCard *otherCard = [otherCards firstObject];
    
    if (otherCard.rank ==self.rank) {
        source = 4;
    }
    else if(otherCard.suit == self.suit){
        source  = 1;
    }
    return source;
}



- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    } }
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
