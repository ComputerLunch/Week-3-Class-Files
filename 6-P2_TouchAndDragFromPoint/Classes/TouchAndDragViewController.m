

#import "TouchAndDragViewController.h"

@implementation TouchAndDragViewController

float startX = 0;
float startY = 0;


- (void)viewDidLoad {
   
	
	[self makeAView];
	[self makeAView];
	[self makeAView];
	[self makeAView];
	[self makeAView];
}


-(void)makeAView{
	
	UIView * newView = [[UIView alloc]initWithFrame:
						 CGRectMake(arc4random() % 320, 
									arc4random() % 480, 150, 80)];
	
	newView.backgroundColor =[UIColor redColor];
	[self.view	 addSubview:newView];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	// Get the touch and place it's location in a CGPoint
	UITouch * myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:self.view];
	
	// Get the view being touched
	UIView * tempView = [myTouch view];
	
	// Check if the view touched is the self.view if it is don't move it!
	if(tempView == self.view){
		// Don't move the center point, return exits the function
		return;
	}
    
    // Get startin point offset based on center of object
    startX = touchCenterPoint.x - tempView.center.x;        
    startY = touchCenterPoint.y - tempView.center.y;
    
    // Adjust the point
    touchCenterPoint.x = touchCenterPoint.x - startX;
    touchCenterPoint.y = touchCenterPoint.y - startY;
    
	// Set views center point
	tempView.center = touchCenterPoint;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch * myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:self.view];
	UIView * tempView = [myTouch view];

	if(tempView == self.view){
		return;
	}
    
    touchCenterPoint.x = touchCenterPoint.x - startX;
    touchCenterPoint.y = touchCenterPoint.y - startY;
    tempView.center = touchCenterPoint;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch * myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:self.view];
	UIView * tempView = [myTouch view];
	
	if(tempView == self.view){
		return;
	}
    
    touchCenterPoint.x = touchCenterPoint.x - startX;
    touchCenterPoint.y = touchCenterPoint.y - startY;
    tempView.center = touchCenterPoint;
}


@end
