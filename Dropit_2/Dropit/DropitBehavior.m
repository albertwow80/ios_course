//
//  DropitBehavior.m
//  Dropit
//
//  Created by albert on 2016/4/8.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "DropitBehavior.h"

@interface DropitBehavior()

@property(strong, nonatomic)UIGravityBehavior *gravity;
@property(strong, nonatomic)UICollisionBehavior *collider;


@end
@implementation DropitBehavior

static CGPoint direction;

-(void)setDirection:(CGPoint)dir
{
    direction.x = dir.x;
    direction.y = dir.y;
}
// get collider and seting delegate
-(UICollisionBehavior*)getCollider
{
    return self.collider;
}
//join push power

-(void)addPush:(id <UIDynamicItem>)item
{
    UIPushBehavior *p = [[UIPushBehavior alloc] initWithItems:[NSArray arrayWithObject:item] mode:UIPushBehaviorModeInstantaneous];
    p.pushDirection = CGVectorMake(direction.x, direction.y);
    [p setMagnitude:1];
    [self addChildBehavior:p];
}

//-(UIGravityBehavior *)gravity
//{
//    if (!_gravity) {
//        _gravity = [[UIGravityBehavior alloc] init];
//        //重力值
//        _gravity.magnitude =0.9;
//    }
//    return _gravity;
//}

-(UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary =YES;
    }
    return _collider;
}

-(void)addItem:(id <UIDynamicItem>)item withPush:(BOOL)wp;
{
    //[self.gravity addItem:item];
    [self.collider addItem:item];
    if (wp) {
        [self addPush:item];
    }
}
-(void)removeItem:(id <UIDynamicItem>)item
{
    //[self.gravity removeItem:item];
    [self.collider removeItem:item];
}
-(instancetype)init
{
    self =[super init];
    //[self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    return self;
    
}
@end
