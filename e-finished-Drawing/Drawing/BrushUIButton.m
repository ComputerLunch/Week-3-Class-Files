#import "BrushUIButton.h"

@implementation BrushUIButton

@synthesize size;

- (id)initWithFrame:(CGRect)frame brushSize:(float)tempSize
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // tempSize
        size = tempSize;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGRect rectangle = CGRectMake(20 - size/2,20- size/2,size ,size);
    
    CGContextAddEllipseInRect(context, rectangle);
    CGContextFillPath(context);
}


@end
