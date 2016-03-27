//
//  Deck.h
//  Lecture2
//
//  Created by cg on 14/3/4.
//  Copyright (c) 2014年 cg. All rights reserved.
//

#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
