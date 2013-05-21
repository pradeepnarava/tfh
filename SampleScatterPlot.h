//
//  SampleScatterPlot.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/20/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"
@interface SampleScatterPlot : NSObject<CPTScatterPlotDataSource> {
	CPTGraphHostingView *_hostingView;
	CPTXYGraph *_graph;
	NSMutableArray *_graphData;
}

@property (nonatomic, retain) CPTGraphHostingView *hostingView;
@property (nonatomic, retain) CPTXYGraph *graph;
@property (nonatomic, retain) NSMutableArray *graphData;

// Methods to create this object and attach it to it's hosting view.
+(SampleScatterPlot *)plotWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data;
-(id)initWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data;

// Specific code that creates the scatter plot.
-(void)initialisePlot;
@end
