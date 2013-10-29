//
//  TouchAndDragAppDelegate.h
//  TouchAndDrag
//
//  Created by Andrew Garrahan on 3/3/12.
//  Copyright 2012 Gutpela. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchAndDragViewController;

@interface TouchAndDragAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchAndDragViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchAndDragViewController *viewController;

@end

