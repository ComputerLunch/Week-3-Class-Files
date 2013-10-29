#import "ViewController.h"
#import "Utility.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIScrollView *scroll = [[UIScrollView alloc]
                            initWithFrame:CGRectMake(0, 0, 200, 200)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.indicatorStyle = UIScrollViewIndicatorStyleBlack; //UIScrollViewIndicatorStyleWhite
	
    // Snaps to a page
    scroll.pagingEnabled = YES;
	
    
    int size = 100;
    int rows = 8;
    
    for (int i = 0; i < rows ;i++) {
       
        UIView * box = [[UIView alloc]initWithFrame:CGRectMake( i * size, 0 , size, size)];
        box.backgroundColor = [Utility randomColor];
        [scroll addSubview:box];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size, size)];
        label.text = [NSString stringWithFormat:@"box %i", i];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        [box addSubview:label];
    }
    
    // Set size of scroll plane / content size
    scroll.contentSize = CGSizeMake(800, 200);
    [self.view addSubview:scroll];
    
}
@end
