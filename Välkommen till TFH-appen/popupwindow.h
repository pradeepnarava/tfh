//
//  popupwindow.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/6/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface popupwindow : NSObject{
    UIView* bgView;
    UIView* bigPanelView;
}

+(void)showWindowWithHTMLFile:(NSString*)fileName insideView:(UIView*)view;

@end


