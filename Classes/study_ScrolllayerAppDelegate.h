//
//  study_ScrolllayerAppDelegate.h
//  study_Scrolllayer
//
//  Created by lee living on 11-2-24.
//  Copyright LieHuo Tech 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface study_ScrolllayerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
