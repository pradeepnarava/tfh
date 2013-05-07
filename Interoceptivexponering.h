//
//  Interoceptivexponering.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/6/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Interoceptivexponering : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
 UITableView *tblView;
    UILabel *ovning;
    UITextView *egen;
    UISlider *slider;
    int noOfSection;
    UILabel *prc;
    IBOutlet UIView *pupview;
     IBOutlet UIView *timerview;
    IBOutlet UIButton *cb1,*cb2,*cb3,*cb4,*cb5,*cb6,*cb7,*cb8,*cb9,*cb10;
 
}
//-(IBAction)switchStateChanged:(id)sender;
@property (nonatomic, retain)IBOutlet UILabel *prc;
@property (nonatomic, retain)IBOutlet UILabel *ovning;
@property (nonatomic, retain)IBOutlet  UITextView *egen;
@property (nonatomic, retain)IBOutlet  UISlider *slider;
@property(nonatomic,retain)IBOutlet UITableView *tblView;

//timer
@property (nonatomic, strong) IBOutlet UILabel *secondsDisplay;
@property (nonatomic, strong) IBOutlet UILabel *minutesDisplay;
@property (nonatomic, strong) NSTimer *secondsTimer;

-(IBAction)newcolm:(id)sender;
- (IBAction)closeBtn:(id)sender;
- (IBAction)closetimer:(id)sender;
- (IBAction)starttimer:(id)sender;
- (IBAction)stoptimer:(id)sender;
- (IBAction)pausetimer:(id)sender;
@end
