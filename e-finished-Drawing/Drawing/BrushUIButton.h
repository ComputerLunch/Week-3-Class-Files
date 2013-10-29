

#import <UIKit/UIKit.h>

@interface BrushUIButton : UIButton{
    
    float size;
    
}

@property float size;

- (id)initWithFrame:(CGRect)frame brushSize:(float)tempSize;

@end
