#import "ViewController.h"
#import "Hero.h"

@interface ViewController (){
    
    Hero * hero;
    NSTimer * timer;
    BOOL isDragging;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Make a hero
    hero = [[Hero alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    hero.center = CGPointMake(150,150);
    [self.view addSubview:hero];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:12.0/60.0 target:self selector:@selector(checkFinger) userInfo:Nil repeats:YES];
}

-(void)checkFinger{
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 1. LEFT & RIGHT
    
    
    // 2. Get touch 4 direction get angle from center of screen
    
    
    // 3. Detecting a swip based direction
    
    // 4. Make joy-stick control
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}

@end
