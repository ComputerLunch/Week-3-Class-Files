#import "UIScrollViewViewController.h"

@implementation UIScrollViewViewController


-(void)viewDidLoad{

	self.view.backgroundColor = [UIColor redColor];
	
    NSMutableArray *photoArray;
    photoArray = [NSMutableArray arrayWithObjects: @"1.jpeg", @"2.jpeg", @"3.jpeg", @"1.jpeg", nil];
    
    UIScrollView *scroll = [[UIScrollView alloc] 
                            initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	
    // Snaps to a page
    scroll.pagingEnabled = YES;
	
    NSInteger numberOfViews = [photoArray count];
	
    for (int i = 0; i < numberOfViews; i++) {
		
        CGFloat yOrigin = i * self.view.frame.size.width;
		UIView *awesomeView = [[UIView alloc] initWithFrame:
                               CGRectMake(yOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
				
        [scroll addSubview:awesomeView];
		[awesomeView release];
        
        // Add Image 
      
        NSString * imageName = [photoArray objectAtIndex:i];
        
        UIImage * awesomeImage = [UIImage imageNamed:imageName];
              
        UIImageView * awesomeImageView = [[UIImageView alloc]initWithImage:awesomeImage ];
        awesomeImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        awesomeImageView.contentMode = UIViewContentModeScaleAspectFit;
                                      
        [awesomeView addSubview:awesomeImageView];
	}
    
	scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
	[self.view addSubview:scroll];
}


@end
