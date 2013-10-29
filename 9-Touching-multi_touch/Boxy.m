#import "Boxy.h"

@implementation Boxy

@synthesize deltaX, deltaY, life;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        life = 150;
        
        self.backgroundColor = [UIColor clearColor];
        
        
        UIImageView * img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
        img.frame = self.bounds;
        img.contentMode = UIViewContentModeScaleAspectFit;
        img.alpha = 0.5;
        [self addSubview:img];
        
        [self drawRect:frame];
        //self.backgroundColor = [self randomColor];
    }
    return self;
}

-(UIColor *)randomColor{
    
    float red = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float green = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float blue = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float alpha = [self randomNumberBetweenZeroAnd:100] * 0.01;
    
    UIColor * tempColor =  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return tempColor;
}

// Gives you a number from 0 to maxnumber and returns an int
-(int)randomNumberBetweenZeroAnd:(int)maxNumber{
    
    int randomNum = arc4random() % maxNumber;
    
    return randomNum;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
       
    CGContextSetFillColorWithColor(context, [self randomColor].CGColor);
    CGRect rectangle = CGRectMake(0, 0, 20, 20);
    
    CGContextAddEllipseInRect(context, rectangle);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect rectangle2 = CGRectMake(7, 7, 10, 10);
    
    CGContextAddEllipseInRect(context, rectangle2);
    
    CGContextFillPath(context);
}



@end
