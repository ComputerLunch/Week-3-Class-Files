#import "Hero.h"

@implementation Hero

UIImageView * graphic;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        graphic = [[UIImageView alloc]initWithFrame:frame];
        graphic.image = [UIImage imageNamed:@"hero_down"];
        [self addSubview:graphic];
    }
    return self;
}


@end
