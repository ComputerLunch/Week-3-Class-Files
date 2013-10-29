#import "TouchAndDragViewController.h"

@implementation TouchAndDragViewController

float startX = 0;
float startY = 0;

UIView * chestView;

- (void)viewDidLoad {
   
    // Make a Chest
    chestView = [[UIView alloc]initWithFrame:CGRectMake(10, 360, 200, 100)];
    chestView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:chestView];
    
	[self makeAView];
	[self makeAView];
	[self makeAView];
	[self makeAView];
	[self makeAView];
}


-(void)makeAView{
	
    UIView * newView = [[UIView alloc]initWithFrame:
						 CGRectMake(arc4random() % 280, 
									arc4random() % 330, 80, 80)];
	
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
    if(tempView == chestView){
		return;
	}
    if(tempView.superview == chestView ){
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

    /*
	if(tempView == self.view){
		return;
	}
    if(tempView == chestView){
		return;
	}
    if(tempView.superview == chestView ){
		return;
	}*/
    
    touchCenterPoint.x = touchCenterPoint.x - startX;
    touchCenterPoint.y = touchCenterPoint.y - startY;
    tempView.center = touchCenterPoint;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch * myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:self.view];
	UIView * tempView = [myTouch view];
	
	
    /*if(tempView == self.view){
		return;
	}
    if(tempView == chestView){
		return;
	}
    if(tempView.superview == chestView ){
		return;
	}*/
    
    
    touchCenterPoint.x = touchCenterPoint.x - startX;
    touchCenterPoint.y = touchCenterPoint.y - startY;
    tempView.center = touchCenterPoint;
    
    // Check if the rectangles are intersecting the chestView
    
    if( CGRectIntersectsRect(tempView.frame, chestView.frame)){
        
        // It's Intersecting!
        [tempView removeFromSuperview]; // trick to remove any view from it's parent view
        
        // put it in the chest
        tempView.transform = CGAffineTransformMakeScale(0.3, 0.3);
       
        float xPlacement =  chestView.frame.size.width;
        float yPlacement =  chestView.frame.size.height; 
        
        // Needs to be a int!!!! get a random place in the chest,, this is to confussing Casting as an int
        xPlacement = arc4random() % [[NSNumber numberWithFloat:xPlacement] intValue];;
        yPlacement = arc4random() % [[NSNumber numberWithFloat:yPlacement] intValue];;
        
        NSLog(@"%f %f", xPlacement , yPlacement);
        
        tempView.center = CGPointMake( xPlacement , yPlacement );
        [chestView addSubview:tempView];
        tempView.backgroundColor = [UIColor greenColor];
      
    }else{
        // It's not do nothing
    }
}


@end
