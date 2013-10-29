//
//  UIScrollViewAppDelegate.h
//  UIScrollView
//
//  Created by Andrew Garrahan on 3/3/12.
//  Copyright 2012 Gutpela. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIScrollViewViewController;

@interface UIScrollViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIScrollViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIScrollViewViewController *viewController;

@end

