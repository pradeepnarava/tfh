//
//  ViewController.h
//  KBTApplication
//
//  Created by mentor on 5/4/13.
//  Copyright (c) 2013 mentor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAWeekView.h"
#import "MAEventKitDataSource.h"
#import "Va_lkommenAppDelegate.h"


@interface ViewController : UIViewController<MAWeekViewDataSource,MAWeekViewDelegate,UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate>
{
    MAEventKitDataSource *_eventKitDataSource;
    Va_lkommenAppDelegate *appDelegate;

    NSMutableArray *timelblArray;
    NSMutableArray *timeslotArray;
    NSMutableArray *minteslotArray;
    UIScrollView *scrollview;
    
    IBOutlet UIView *popupView1,*popupView2;
    IBOutlet UILabel *lblSlide;
    IBOutlet UISlider *slider;
    IBOutlet UIDatePicker *pickerOne;
    IBOutlet UIDatePicker *pickerTwo;
    IBOutlet UIDatePicker *pickerThree;
    IBOutlet UIDatePicker *pickerFour;
    IBOutlet UIView *settingView;
    IBOutlet UIScrollView *scrollSetting;

    IBOutlet UIButton *MonBtn;
    IBOutlet UIButton *TueBtn;
    IBOutlet UIButton *WedBtn;
    IBOutlet UIButton *ThurBtn;
    IBOutlet UIButton *FriBtn;
    IBOutlet UIButton *SatBtn;
    IBOutlet UIButton *SunBtn;
    
    IBOutlet UITextView *messageEventTxtView;
    IBOutlet UITextField *txtLbl1,*txtLbl2,*txtLbl3,*txtLbl4;

  
    
    IBOutlet UIButton *Week_prevBarBtn;
    IBOutlet UIButton *Week_nextBarBtn;
    IBOutlet UIButton *Week_weekBarBtn;
    NSDate *selectedDate;
    UIEvent *event;
    CGPoint initialPoint;
    CGPoint endPoint;
}

@property (nonatomic, retain) Va_lkommenAppDelegate *appDelegate;

- (IBAction)selectOnWeekDay:(id)sender;
- (IBAction)selectSennestBtn:(id)sender;
- (IBAction)closeBtn:(id)sender;
- (IBAction)selectSlider:(id)sender;

- (IBAction)selectSettingButton:(id)sender;
@end
