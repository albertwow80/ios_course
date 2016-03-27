//
//  Card.h
//  Lecture2
//
//  Created by cg on 14/3/4.
//  Copyright (c) 2014年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;
- (int)match:(NSArray *)otherCards;

@end
