//
//  DropitBehavior.h
//  Dropit
//
//  Created by albert on 2016/4/8.
//  Copyright © 2016年 albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior
-(void)addItem:(id <UIDynamicItem>)item;
-(void)removeItem:(id <UIDynamicItem>)item;




@end
