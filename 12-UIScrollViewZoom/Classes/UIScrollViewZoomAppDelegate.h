//
//  UIScrollViewZoomAppDelegate.h
//  UIScrollViewZoom
//
//  Created by Andrew Garrahan on 3/3/12.
//  Copyright 2012 Gutpela. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIScrollViewZoomViewController;

@interface UIScrollViewZoomAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIScrollViewZoomViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIScrollViewZoomViewController *viewController;

@end

