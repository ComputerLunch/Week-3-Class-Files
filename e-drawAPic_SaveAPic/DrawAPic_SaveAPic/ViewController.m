#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    
    UIColor * currentColor;
    UIImageView * drawImage;
    CGPoint lastPoint;
    CGPoint startLocation;
}

-(IBAction)saveImage:(id)sender;

@end


@implementation ViewController

- (void)viewDidLoad
{
    drawImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    drawImage.backgroundColor = [UIColor lightGrayColor];
    [self.view insertSubview:drawImage atIndex:0];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	
	// Retrieve the touch point
	CGPoint pt = [[touches anyObject] locationInView:drawImage];
	startLocation = pt;
	lastPoint = [touch locationInView:drawImage];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];	
	
    NSSet *allTouches = [event allTouches];
	int count = [allTouches count]; 
	
    CGPoint currentPoint = [touch locationInView:drawImage];
  
    UIGraphicsBeginImageContext(self.view.frame.size);
    [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineJoinRound);//kCGLineCapRound
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
    
    // Set Color 
    CGContextRef context = UIGraphicsGetCurrentContext();
    //[currentColor set];
  
    // Set Width
    CGContextSetLineWidth(context, 15);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

-(IBAction)saveImage:(id)sender{
	
    // Gets context of UIView and places it in UIIMage for saving
  /*  UIGraphicsBeginImageContext(drawImage.bounds.size);
    [drawImage.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();*/
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    // Write  image to photo libary 
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
}

@end
