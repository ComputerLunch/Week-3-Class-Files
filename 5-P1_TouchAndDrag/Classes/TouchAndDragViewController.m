

#import "TouchAndDragViewController.h"

@implementation TouchAndDragViewController



- (void)viewDidLoad {
   
	
	[self makeAView];
	[self makeAView];
}


-(void)makeAView{
	
	UIView * newView = [[UIView alloc]initWithFrame:
						 CGRectMake(arc4random() % 320, 
									arc4random() % 480, 150, 150)];
	
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
    
	tempView.center = touchCenterPoint;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch * myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:self.view];
	UIView * tempView = [myTouch view];
	
	if(tempView == self.view){
		return;
	}
	tempView.center = touchCenterPoint;
}

@end
