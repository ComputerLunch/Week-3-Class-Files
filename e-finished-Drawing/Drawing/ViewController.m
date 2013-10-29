#import "ViewController.h"
#import "BrushUIButton.h"

@interface ViewController (){

    UIColor * currentColor;
    float brushSize;
    BOOL toggle; 
    
    CGPoint lastPoint;
    CGPoint startLocation;
    
    UIScrollView * colorScroll;
    UIScrollView * brushSizeScroll;
    
    UIImageView * drawImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    currentColor = [UIColor redColor];
    brushSize = 10;
    toggle = NO;
    
    
    // Add drawing layer
    drawImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    drawImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:drawImageView];
    
    // COLOR Scroll -----------------------
    colorScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 45, 350)];
    colorScroll.pagingEnabled = NO;
    colorScroll.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:colorScroll];
   
    NSArray * colors = [[NSArray alloc]initWithObjects:
                        [UIColor blueColor],
                        [UIColor redColor],
                        [UIColor yellowColor],
                        [UIColor orangeColor],
                        [UIColor cyanColor],
                        [UIColor greenColor],
                        [UIColor purpleColor],
                        [UIColor whiteColor],
                        [UIColor lightGrayColor],
                        [UIColor darkGrayColor],
                        [UIColor blackColor],nil ];
    
    int space = 40;
    
    for (int i = 0; i < [colors count]; i++) {
        
        UIButton * colorSwatch = [UIButton buttonWithType:UIButtonTypeCustom];
        colorSwatch.backgroundColor = [colors objectAtIndex:i];
        [colorSwatch addTarget:self action:@selector(pickColor:) forControlEvents:UIControlEventTouchUpInside];
        colorSwatch.frame = CGRectMake(0, 0, space, space);
        colorSwatch.center = CGPointMake( space/2 , space/2 + space * i);
        [colorScroll addSubview:colorSwatch];
    }
   
    colorScroll.contentSize = CGSizeMake( space ,space * [colors count] );
    colorScroll.center = CGPointMake(22, 240);
    
    
    // Brush Size Scroll -------------- 
    brushSizeScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 45, 350)];
    brushSizeScroll.pagingEnabled = NO;
    brushSizeScroll.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:brushSizeScroll];
    
    
    NSArray * brushSizes = [[NSArray alloc]initWithObjects: 
                            [NSNumber numberWithFloat:2], 
                            [NSNumber numberWithFloat:4], 
                            [NSNumber numberWithFloat:8],
                            [NSNumber numberWithFloat:15],
                            [NSNumber numberWithFloat:20], 
                            [NSNumber numberWithFloat:30],
                            [NSNumber numberWithFloat:40], 
                            [NSNumber numberWithFloat:80] ,nil ];

    
    
    for (int i = 0; i < [brushSizes count]; i++) {
        
        float tempBrushSize = [[brushSizes objectAtIndex:i] floatValue];  
        
        BrushUIButton * brushSwatch = [[BrushUIButton alloc]initWithFrame: 
                                       CGRectMake(0,0,20,20) brushSize:tempBrushSize];
        
        [brushSwatch addTarget:self action:@selector(setBrushSize:) forControlEvents:UIControlEventTouchUpInside];
        brushSwatch.frame = CGRectMake(0, 0, space, space);
        brushSwatch.center = CGPointMake( space/2 , space/2 + space * i);
        [brushSizeScroll addSubview:brushSwatch];
    }
    
    brushSizeScroll.contentSize = CGSizeMake( space ,space * [colors count] );
    brushSizeScroll.center = CGPointMake(300, 240);
    
    // Toggle Button ----------------------
    UIButton * toggleBtn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [toggleBtn addTarget:self action:@selector(toggle) forControlEvents:UIControlEventTouchDown];
    toggleBtn.center = CGPointMake(15, 15);
    [self.view addSubview:toggleBtn];
}

-(void)toggle{
    
    [UIView beginAnimations:@"myName" context:nil];
    [UIView setAnimationDuration:0.5];
    
    // Do Animation
    if (toggle == YES) {
        colorScroll.center = CGPointMake(22, 240);
        brushSizeScroll.center = CGPointMake(300, 240);
        toggle = NO;
    }else {
        colorScroll.center = CGPointMake(-60, 240);
        brushSizeScroll.center = CGPointMake(300+60, 240);
        toggle = YES; 
    }
    
    [UIView commitAnimations];
}

// Touching
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	
	// Retrieve the touch point
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

// Get Back ground color place it as current color
-(void)pickColor:(UIButton *)sender{
    
    UIColor * temp = sender.backgroundColor;
    currentColor = temp;
}

// Get Back ground color place it as current color
-(void)setBrushSize:(BrushUIButton *)sender{
    brushSize = sender.size;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Don't rotate please
    return NO;
}

@end
