//
//  ExampleView.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/21/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "SampleScatterPlot.h"
@interface ExampleView : UIViewController{
    IBOutlet CPTGraphHostingView *_graphHostingView;
    SampleScatterPlot *_scatterPlot;
}

@property (nonatomic, retain) SampleScatterPlot *scatterPlot;

@end
