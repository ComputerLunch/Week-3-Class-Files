#import "ViewController.h"
#import "Boxy.h"
#import <QuartzCore/QuartzCore.h>

#define TOTAL_BOXS 20
#define GRAVITY 0.4
#define FRICTION 0.98

#define SCREEN_WIDTH self.view.frame.size.width  
#define SCREEN_HEIGHT self.view.frame.size.height

@interface ViewController (){
    
    NSTimer * myTimer;
    NSMutableArray * particles;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.view.multipleTouchEnabled = YES;
    
    // init array of box
    particles = [[NSMutableArray alloc]init];
    
    CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(stepWorld:)];
    
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

// Step on display link
-(void)stepWorld:(id)sender{
    
    // Update position based on offset of delta found in Boxy
    for (int i = 0; i < [particles count] ; i++) {
        Boxy * box = [particles objectAtIndex:i];
        
        // Update delta
        box.center = CGPointMake(box.center.x + box.deltaX , box.center.y + box.deltaY );
        
        box.deltaY = (box.deltaY * FRICTION) + GRAVITY ;
        box.deltaX = box.deltaX * FRICTION;
        

        // take away life
        box.life --;
        
        if (box.life < 50) {
            box.alpha -= 0.02;
        }
        
        box.transform = CGAffineTransformRotate(box.transform, 0.2);
        
        // If box has 0 life remove it from the view & remove it form our array
        if(box.life < 0){
            [box removeFromSuperview];
            [particles removeObjectAtIndex:i];
        }
        
        // Check for screen bounds and reverse direction
        if(box.center.x < 0){
            box.deltaX *= -1;
        }else if(box.center.x > SCREEN_WIDTH){
            box.deltaX *= -1;
        }
        
        if(box.center.y < 0){
            box.deltaY *= -1;
        }else if(box.center.y > SCREEN_HEIGHT){
            box.deltaY *= -1;
        }
    }
}

-(void)spawnSpriteOnTouch:(CGPoint)pnt{
    
    int size = 20;
    
    CGPoint pos = CGPointMake( pnt.x , pnt.y );
    CGRect rect = CGRectMake(pos.x, pos.y, size, size);
    
    Boxy * tempBox = [[Boxy alloc]initWithFrame:rect];
    tempBox.deltaX = [self randomFloatBetween:-4.0 maxNum:4.0];
    tempBox.deltaY = [self randomFloatBetween:-4.0 maxNum:4.0];
    [self.view addSubview:tempBox];
    
    [particles addObject:tempBox];
}

///////////////////////////////////////
// Touch - get force based on user swipe
///////////////////////////////////////
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint pnt = [touch locationInView:self.view];
    
    UITouch *touch2;
    UITouch *touch3;
    

    GLuint touchCount = [touches count];
    
    if (touchCount == 3) {
        touch3 = [[touches allObjects] objectAtIndex:2];
        CGPoint pnt3 = [touch3 locationInView:self.view];
        touch2 = [[touches allObjects] objectAtIndex:1];
        CGPoint pnt2 = [touch2 locationInView:self.view];
        
        [self spawnSpriteOnTouch:pnt3];
        [self spawnSpriteOnTouch:pnt2];
        [self spawnSpriteOnTouch:pnt];
    } else if(touchCount == 2){
        touch2 = [[touches allObjects] objectAtIndex:1];
        CGPoint pnt2 = [touch2 locationInView:self.view];
        
        [self spawnSpriteOnTouch:pnt2];
        [self spawnSpriteOnTouch:pnt];
    } else {
        
        [self spawnSpriteOnTouch:pnt];
    }
}

-(int) randomFloatBetween:(int)min maxNum:(int)max {
    
    int radNum = min + (arc4random() % (int)(max - min));
    
	return (int)radNum;
}

@end
