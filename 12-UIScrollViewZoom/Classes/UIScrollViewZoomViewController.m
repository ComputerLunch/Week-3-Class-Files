#import "UIScrollViewZoomViewController.h"

@implementation UIScrollViewZoomViewController 

UIImageView * image; 

-(void)viewDidLoad{
	
    [self.view setMultipleTouchEnabled:YES];
    
	UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	scroll.backgroundColor = [UIColor blackColor];
	scroll.delegate = self;
    
	image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
	
    scroll.contentSize = image.frame.size;
	[scroll addSubview:image];
	scroll.minimumZoomScale = scroll.frame.size.width / image.frame.size.width;
	scroll.maximumZoomScale = 2.0;
	[scroll setZoomScale:scroll.minimumZoomScale];
	self.view = scroll;
	[scroll release];	
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return image;
}


@end
