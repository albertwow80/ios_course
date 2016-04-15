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
@property (strong, nonatomic) IBOutlet UILabel *labelScore;
@end

@implementation ViewController
static const CGSize DROP_SIZE = {20,20};
static CGPoint curren_location;
static CGPoint end_location;
int score = 0;

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(nonnull id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    UIView *v1 = (UIView*)item1;
    UIView *v2 = (UIView*)item2;
    if ([v1 backgroundColor] == [v2 backgroundColor]) {
        [self.dropitBehavior removeItem:item1];
        [self.dropitBehavior removeItem:item2];
        score +=7;
        self.labelScore.text = [NSString stringWithFormat:@"%d",score];
        [UIView animateWithDuration:0.5 animations:^{
            v1.alpha = 0;
            v2.alpha = 0;
        }completion:^(BOOL finished){
            if (finished) {
                [self animateRemovingDrops:[NSArray arrayWithObjects:item1,item2,nil]];
            }
        }];
    }
}






-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self removeCompletedRows];
}

-(BOOL)removeCompletedRows
{
    NSMutableArray *dropsToRemove = [[NSMutableArray alloc] init];
    for (CGFloat y = self.gameView.bounds.size.height-DROP_SIZE.height/2; y > 0; y-= DROP_SIZE.height){
        BOOL rowIsComplete = YES;
        NSMutableArray *dropsFound = [[NSMutableArray alloc] init];
        
        for (CGFloat x =DROP_SIZE.width/2; x<=self.gameView.bounds.size.width-DROP_SIZE.width/2; x+=DROP_SIZE.width) {
            
            UIView *hitView  = [self.gameView hitTest:CGPointMake(x,y) withEvent:NULL];
            if ([hitView superview] == self.gameView) {
                [dropsFound addObject:hitView];
            }
            else{
                rowIsComplete = NO;
                break;
            }
        }
        if (![dropsFound count]) break;
        if (rowIsComplete) [dropsToRemove addObjectsFromArray:dropsFound];
    }
    if ([dropsToRemove count]) {
            for (UIView *drop in dropsToRemove) {
                [self.dropitBehavior removeItem:drop];
            }
            [self animateRemovingDrops:dropsToRemove];
    }
    return NO;
}



    
    
//Random Select one position
-(void)animateRemovingDrops:(NSArray *)dropsToRemove
{
        [UIView animateWithDuration:1.0 animations:^{
            for (UIView *drop in dropsToRemove) {
                int x = (arc4random()%(int)(self.gameView.bounds.size.width*5))-(int)self.gameView.bounds.size.width*2;
                int y = self.gameView.bounds.size.height;
                drop.center = CGPointMake(x, -y);
            }
        }
        completion:^(BOOL finished)
            {[dropsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }];
}




//init Behavior
-(DropitBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropitBehavior];
        [_dropitBehavior getCollider].collisionDelegate = self;
    }
    return _dropitBehavior;
}


-(IBAction)pan:(UIPanGestureRecognizer *)recognizer{
    static UIView *dropView;
    
    // record inital position
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        curren_location = [recognizer locationInView:self.view];
        dropView = [self drop2];
    }
    // record gesture final position
    else if (recognizer.state ==UIGestureRecognizerStateEnded) {
            end_location = [recognizer translationInView:self.view];
            [self.dropitBehavior setDirection:end_location];
            end_location = CGPointZero;
            [self.dropitBehavior addItem:dropView withPush:YES];
        }
}
//generator drop
-(UIView*)drop2{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = CGSizeMake(20, 20);
    frame.origin.x = curren_location.x;
    frame.origin.y = self.gameView.bounds.size.height-DROP_SIZE.height*2;
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    return dropView;
}


-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        _animator.delegate = self;
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
    
    //
    for (int i=0; i < self.gameView.bounds.size.height/3; i+=(DROP_SIZE.height+1)) {
        for (int j=0; j<=self.gameView.bounds.size.width-DROP_SIZE.width; j+=(DROP_SIZE.width+1)) {
            frame.origin.x = j;
            frame.origin.y = i;
            UIView *dropView = [[UIView alloc] initWithFrame:frame];
            dropView.backgroundColor = [self randomColor];
            [self.gameView addSubview:dropView];
            [self.dropitBehavior addItem:dropView withPush:NO];
        }
    }
    
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor=[self randomColor];
    [self.gameView addSubview:dropView];
    //增加屬性
    
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
    //inital Drop
    [self drop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
