#import "ViewController.h"
#import "Hero.h"

@interface ViewController (){
    
    Hero * hero;
    NSTimer * timer;
    BOOL isDragging;
    
    CGPoint startPnt;
    CGPoint currentPnt;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Make a hero
    hero = [[Hero alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    hero.center = CGPointMake(150,150);
    [self.view addSubview:hero];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(checkFinger) userInfo:Nil repeats:YES];
}

-(void)checkFinger{
    
    if(isDragging){
        // 1 - get slope of line between two points
        
        // 2 - move hero in that direction
        
        float pressure = 60;
        
        float slopeX =  (startPnt.x - currentPnt.x)/pressure ;
        float slopeY =  (startPnt.y - currentPnt.y)/pressure ;
        
        
        hero.center = CGPointMake(hero.center.x - slopeX, hero.center.y - slopeY);
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
	UITouch * myTouch = [touches anyObject];
	CGPoint pnt = [myTouch locationInView:self.view];
    
    startPnt = pnt;
    currentPnt = pnt;
    
    isDragging = true;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * myTouch = [touches anyObject];
	CGPoint pnt = [myTouch locationInView:self.view];
    
    currentPnt = pnt;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    isDragging =  false;
}

@end
