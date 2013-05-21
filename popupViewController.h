//
//  popupViewController.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/21/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PopupDelegate;
@interface popupViewController : UIViewController
@property (assign, nonatomic) id <PopupDelegate>delegate;

@end
@protocol PopupDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(popupViewController*)secondDetailViewController;
@end