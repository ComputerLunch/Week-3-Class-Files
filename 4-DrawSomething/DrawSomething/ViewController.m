#import "ViewController.h"

@interface ViewController (){
    
    UIColor * currentColor;
    float brushSize;
    
    CGPoint lastPoint;
    CGPoint startLocation;
    
    UIImageView * drawImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    currentColor = [UIColor redColor];
    brushSize = 5;
    
    // Add drawing layer
    drawImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    drawImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:drawImageView];
}

// Touching
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	CGPoint pt = [[touches anyObject] locationInView:drawImageView];
    
	startLocation = pt;
    lastPoint = [touch locationInView:drawImageView];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:drawImageView];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [drawImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Set stroke size ,line color, cap style
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brushSize);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), currentColor.CGColor);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineJoinRound);//kCGLineCapRound
    
    // Begin & Move Line
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    drawImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

@end
