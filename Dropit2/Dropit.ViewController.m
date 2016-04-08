//
//  ViewController.m
//  Dropit
//
//  Created by albert on 2016/4/8.
//  Copyright © 2016年 albert. All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (strong,nonatomic) DropitBehavior *dropitBehavior;
@end

@implementation ViewController
static const CGSize DROP_SIZE = {40,40};


-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self removeCompletedRows];
}

-(BOOL)removeCompletedRows{
    NSMutableArray *dropsToRemove = [[NSMutableArray alloc] init];
    for (CGFloat y = self.gameView.bounds.size.height-DROP_SIZE.height/2; y > 0; y-= DROP_SIZE.height) {
        BOOL rowIsComplete = YES;
        
    }
}






//init Behavior
-(DropitBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropitBehavior];
    }
    return _dropitBehavior;
}


-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        //_animator.delegate = self;
    }
    return _animator;
}



- (IBAction)tap:(id)sender {
    [self drop];
}
-(void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    
    int x = (arc4random()%(int)self.gameView.bounds.size.width)/DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor=[self randomColor];
    [self.gameView addSubview:dropView];
    //增加屬性
    [self.dropitBehavior addItem:dropView];
    [self.dropitBehavior addItem:dropView];
}
-(UIColor *)randomColor
{
    switch (arc4random()%5) {
        case 0:return [UIColor greenColor];
        case 1:return [UIColor blueColor];
        case 2:return [UIColor orangeColor];
        case 3:return [UIColor redColor];
        case 4:return [UIColor purpleColor];
            
    }
    return [UIColor blackColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
