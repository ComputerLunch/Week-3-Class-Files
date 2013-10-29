#import "ViewController.h"

@interface ViewController (){

UIImageView * imgNyc;

}@end

@implementation ViewController

- (void)viewDidLoad
{
    // Turn on multi touch
    self.view.multipleTouchEnabled = YES;
    
    imgNyc = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nyc.jpeg"]];
    imgNyc.frame = CGRectMake(0, 0, 200, 150);
    imgNyc.center = CGPointMake(150, 150);
    [self.view addSubview:imgNyc];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint pnt1 = [touch locationInView:self.view];
    
    UITouch *touch2;

    GLuint touchCount = [touches count];
    
    // Get two touches
    if(touchCount == 2){
        touch2 = [[touches allObjects] objectAtIndex:1];
        CGPoint pnt2 = [touch2 locationInView:self.view];
        
        // Scale and Rotate
        
        // Get distence
        double dx = (pnt2.x - pnt1.x);
        double dy = (pnt2.y - pnt1.y);
        double dist = sqrt(dx*dx + dy*dy);
        
        printf("%2.2f \n", dist);
        
        float scale = dist * 0.01;
        imgNyc.transform = CGAffineTransformMakeScale(scale, scale);
        
        // Get angle
        float angle = [self calculateAngle:pnt1.x :pnt1.y :pnt2.x :pnt2.y];
        imgNyc.transform = CGAffineTransformRotate( imgNyc.transform, angle);
        
    } else { // Get one touch
        
        // Move image
        imgNyc.center = pnt1;
    }
}

- (float) calculateAngle:(float)x1 :(float)y1 :(float)x2 :(float)y2
{
    // DX
    float x =  x1 - x2;
    // DY
    float y =  y1 - y2;
    float angle = 180 + (atan2(-x, -y) + (180/M_PI));
    
    // Adjust to give value ranging between 0 and 360.
    //float angle = radians;
    return angle * -1;
}
@end
