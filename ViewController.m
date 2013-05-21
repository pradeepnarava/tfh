//
//  ViewController.m
//  KBTApplication
//
//  Created by mentor on 5/4/13.
//  Copyright (c) 2013 mentor. All rights reserved.
//

#import "ViewController.h"
#import "MAWeekView.h"
#import "MAEvent.h"
#import "MAEventKitDataSource.h"

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]


@interface ViewController ()
@property (readonly) MAEvent *event;
@property (readonly) MAEventKitDataSource *eventKitDataSource;

@end
BOOL ischeck;

@implementation ViewController
@synthesize appDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appDelegate = (Va_lkommenAppDelegate *)[[UIApplication sharedApplication]delegate];

    timelblArray = [[NSMutableArray alloc]initWithObjects:@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24",nil];
    
    ischeck = YES;
   // minteslotArray = [[NSMutableArray alloc]initWithObjects:@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24"@"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39",@"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54"@"55", @"56", @"57", @"58", @"59", @"60", nil];
    
    timeslotArray = [[NSMutableArray alloc]initWithObjects:@"1:00 AM",@"2:00 AM",@"3:00 AM",@"4:00 AM",@"5:00 AM",@"6:00 AM",@"7:00 AM",@"8:00 AM",@"9:00 AM",@"10:00 AM",@"11:00 AM",@"12:00 PM",@"1:00 PM",@"2:00 PM",@"3:00 PM",@"4:00 PM",@"5:00 PM",@"6:00 PM",@"7:00 PM",@"8:00 PM",@"9:00 PM",@"10:00 PM",@"11:00 PM",@"12:00 AM",nil];
    
    self.navigationController.navigationBar.hidden = YES;
    
    scrollview=[[UIScrollView alloc]init];
    scrollview.delegate=self;
    [self.view addSubview:scrollview];
    scrollview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:settingView];
    settingView.hidden = YES;
    
    
    if(deviceIdiom==iPhone)
    {
        scrollview.frame=CGRectMake(0 , 100, 320, 380);
        scrollview.contentSize=CGSizeMake(320,1450);
        
        pickerOne = [[UIDatePicker alloc] initWithFrame:CGRectMake(185, 85, 100, 100)];
        pickerOne.datePickerMode=UIDatePickerModeTime;
        pickerOne.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, -90, 0);
        pickerOne.backgroundColor = [UIColor clearColor];
        [scrollSetting addSubview:pickerOne];
        
        pickerTwo = [[UIDatePicker alloc] initWithFrame:CGRectMake(10, 300, 100, 100)];
        pickerTwo.datePickerMode=UIDatePickerModeTime;
        pickerTwo.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, -90, 0);
        [scrollSetting addSubview:pickerTwo];
        
        pickerThree = [[UIDatePicker alloc] initWithFrame:CGRectMake(185, 300, 100, 100)];
        pickerThree.datePickerMode=UIDatePickerModeTime;
        pickerThree.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, -90, 0);
        [scrollSetting addSubview:pickerThree];
        
        pickerFour = [[UIDatePicker alloc] initWithFrame:CGRectMake(185, 590, 100, 100)];
        pickerFour.datePickerMode=UIDatePickerModeTime;
        pickerFour.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, -90, 0);
        [scrollSetting addSubview:pickerFour];
       
        scrollSetting.contentSize=CGSizeMake(320,850);
    
    }else
    {
        scrollview.frame=CGRectMake(0 , 100, 768, 820);
        scrollview.contentSize=CGSizeMake(320,1450);
        
    }
    
    [scrollSetting setScrollEnabled:YES];

    
    for(int i=0;i<[timelblArray count];i++)
    {
        
        UIImageView *lineImageview= [[UIImageView alloc] init];//WithFrame:CGRectMake(46,30*i, 320, 30)];
        lineImageview.backgroundColor = [UIColor clearColor];
        lineImageview.image = [UIImage imageNamed:@"Agenda.png"];
        [scrollview addSubview:lineImageview];
        
        
        UIButton *eventBtn= [[UIButton alloc] init];//WithFrame:CGRectMake(46,30*i, 320, 30)];
        eventBtn.backgroundColor = [UIColor lightGrayColor];
        [eventBtn addTarget:self action:@selector(addEventTouchupInside:) forControlEvents:UIControlEventTouchUpInside];
        //[scrollview addSubview:eventBtn];
        
        
        UILabel *slotlbl=[[UILabel alloc]init];//WithFrame:CGRectMake(10,20+30*i-1,70,20)];
        slotlbl.backgroundColor=[UIColor clearColor];
        slotlbl.font=[UIFont fontWithName:@"HelveticaNeue" size:14.0];
        slotlbl.text=[timelblArray objectAtIndex:i];
        [scrollview addSubview:slotlbl];
        
        if (deviceIdiom == iPhone) {
            lineImageview.frame = CGRectMake(25,60*i, 320, 60);
            slotlbl.frame = CGRectMake(2,50+60*i-1,70,20);
            //eventBtn.frame = CGRectMake(30,30*i+5, 320, 20);
            
        } else {
            lineImageview.frame = CGRectMake(46,60*i, 768, 60);
            slotlbl.frame = CGRectMake(10,20+60*i-1,70,20);
            //popupView1.frame = CGRectMake(0, 0, 768, 1004);
            //eventBtn.frame = CGRectMake(50,60*i+5, 768, 50);

        }
    }

    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //tapScroll.cancelsTouchesInView = NO;
    [scrollview addGestureRecognizer:tapScroll];

    [self.view addSubview:popupView1];
    popupView1.hidden=YES;

    [self.view addSubview:popupView2];
    popupView2.hidden=YES;
    
    [slider setMinimumValue:1];
    [slider setMaximumValue:100];
    [slider setValue:75];

    
    NSDate *today = [NSDate date];
    appDelegate.dateSelected = today;
    selectedDate=today;
    NSDate *dt = [self firstDayOfWeekFromDate:today];

    /*NSDateComponents *componentts = [[NSDateComponents alloc] init];
    [componentts setWeekday:2]; // Monday
    [componentts setWeekdayOrdinal:1]; // The first Monday in the month
    [componentts setMonth:5]; // May
    [componentts setYear:2013];
    NSCalendar *gregorians = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorians dateFromComponents:componentts];
    NSLog(@"%@, %@",date,dt);*/
    
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    
    // Get the weekday component of the current date
    
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit
                                           
                                                       fromDate:today];
    
    
    
    /*
     
     Create a date components to represent the number of days to subtract from the current date.
     
     The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today is Sunday, subtract 0 days.)
     
     */
    
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 2)];
        
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract
                               
                                                         toDate:today options:0];
    
    
    
    /*
     
     Optional step:
     
     beginningOfWeek now has the same hour, minute, and second as the original date (today).
     
     To normalize to midnight, extract the year, month, and day components and create a new date from those components.
     
     */
    
    NSDateComponents *components =
    
    [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                           
                           NSDayCalendarUnit) fromDate: beginningOfWeek];
    
    beginningOfWeek = [gregorian dateFromComponents:components];

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM yyyy"]; //yyyy-MM-dd HH:mm:ss zzz
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Date/Time is %@ %d", dateString,[self getnewdates]);
    [Week_weekBarBtn setTitle:dateString forState:UIControlStateNormal];    
    event = [[UIEvent alloc]init];
    
    [self setDates];
    
}

- (void)tapped:(UITapGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:scrollview];
    NSLog(@"x :%.1f, y :%.1f ",point.x,point.y);

   
    [self.view bringSubviewToFront:popupView2];
  popupView2.hidden = NO;
  [UIView beginAnimations:@"curlInView" context:nil];
   [UIView setAnimationDuration:3.0];
   [UIView commitAnimations];
    
    
}


- (void)setDates
{
    NSArray *arr = [self lastSevenDays];
    
    [MonBtn setTitle:[arr objectAtIndex:0] forState:UIControlStateNormal];
    [TueBtn setTitle:[arr objectAtIndex:1] forState:UIControlStateNormal];
    [WedBtn setTitle:[arr objectAtIndex:2] forState:UIControlStateNormal];
    [ThurBtn setTitle:[arr objectAtIndex:3] forState:UIControlStateNormal];
    [FriBtn setTitle:[arr objectAtIndex:4] forState:UIControlStateNormal];
    [SatBtn setTitle:[arr objectAtIndex:5] forState:UIControlStateNormal];
    [SunBtn setTitle:[arr objectAtIndex:6] forState:UIControlStateNormal];
}

- (NSDate *)firstDayOfWeekFromDate:(NSDate *)date {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:date];
    [comps setWeekday:2]; // 2: monday
    return [calendar dateFromComponents:comps];
}

- (NSInteger)getnewdates
{
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comp = [cal components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    return [comp weekday];
}

- (NSArray *)lastSevenDays {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE,  dd"];
    
    NSDate *date = selectedDate;
    NSMutableArray *weekDays = [[NSMutableArray alloc] initWithCapacity:7];
    for (int i = 0; i > -7; i--) {
        NSString *weekDay = [formatter stringFromDate:date];
        [weekDays addObject:weekDay];
        date = [self dateBySubtractingOneDayFromDate:date];
    }
    return weekDays;
}


- (NSDate *)dateBySubtractingOneDayFromDate:(NSDate *)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *minusOneDay = [[NSDateComponents alloc] init];
    [minusOneDay setDay:+1];
    NSDate *newDate = [cal dateByAddingComponents:minusOneDay
                                           toDate:date
                                          options:NSWrapCalendarComponents];
    
    

    return newDate;
}

-(IBAction)Week_CalendarActionEvents:(id)sender {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    NSDate *nextDate;
    
    if(sender==Week_prevBarBtn)  // Previous button events
        [offsetComponents setDay:-7];
    else if(sender==Week_nextBarBtn) // next button events
        [offsetComponents setDay:7];
    
   
    nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:appDelegate.dateSelected options:0];
    
    appDelegate.dateSelected = nextDate;
    
    NSDateComponents *components = [gregorian components:NSWeekCalendarUnit fromDate:appDelegate.dateSelected];
    NSInteger week = [components week];
    NSInteger day = [components day];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM YYYY"];
    NSString *stringFromDate = [formatter stringFromDate:selectedDate];
    [Week_weekBarBtn setTitle:[NSString stringWithFormat:@"%@,Week %d",stringFromDate,week] forState:UIControlStateNormal];
    //[Week_weekBarBtn setTitle:[NSString stringWithFormat:@"%@,Week %d",stringFromDate,week]];
        
    NSArray *arr = [self lastSevenDays];
    
    [MonBtn setTitle:[arr objectAtIndex:0] forState:UIControlStateNormal];
    [TueBtn setTitle:[arr objectAtIndex:1] forState:UIControlStateNormal];
    [WedBtn setTitle:[arr objectAtIndex:2] forState:UIControlStateNormal];
    [ThurBtn setTitle:[arr objectAtIndex:3] forState:UIControlStateNormal];
    [FriBtn setTitle:[arr objectAtIndex:4] forState:UIControlStateNormal];
    [SatBtn setTitle:[arr objectAtIndex:5] forState:UIControlStateNormal];
    [SunBtn setTitle:[arr objectAtIndex:6] forState:UIControlStateNormal];
}




-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    NSLog(@"X: %f",location.x);
    NSLog(@"Y: %f",location.y);
}

//In the touch began code I have took the initialPoint from where the touch has began and saved it in the variable initialPoint



- (void)addEventTouchupInside:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    NSLog(@"%@",btn);
    
    [self.view bringSubviewToFront:popupView2];
    popupView2.hidden = NO;
    [UIView beginAnimations:@"curlInView" context:nil];
    
    [UIView setAnimationDuration:3.0];
    
    [UIView commitAnimations];
}

- (IBAction)selectSennestBtn:(id)sender
{
    [self.view bringSubviewToFront:popupView1];
    popupView1.hidden = NO;
    
    lblSlide.text = [NSString stringWithFormat:@"%.1f",slider.value];
    
    [UIView beginAnimations:@"curlInView" context:nil];
    
    [UIView setAnimationDuration:3.0];
    
    [UIView commitAnimations];
    
}

- (IBAction)closeBtn:(id)sender
{
    popupView1.hidden=YES;
    popupView2.hidden=YES;
    settingView.hidden = YES;
}

- (IBAction)selectSettingButton:(id)sender
{
    [self.view bringSubviewToFront:settingView];
    settingView.hidden = NO;
    [UIView beginAnimations:@"curlInView" context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView commitAnimations];
    
}
- (IBAction)selectSlider:(id)sender
{
    UISlider *sliderObj = (UISlider *)sender;
    lblSlide.text = [NSString stringWithFormat:@"%.f",sliderObj.value];

}

- (IBAction)selectOnWeekDay:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSString *strNibname;
     if (deviceIdiom == iPhone) {
         strNibname = @"DayViewController_iPhone";
     } else {
         strNibname = @"DayViewController";

     }
//    DayViewController *dayObj = [[DayViewController alloc]initWithNibName:strNibname bundle:[NSBundle mainBundle]];
//    dayObj.strTitle= btn.titleLabel.text;
//    [self presentViewController:dayObj animated:YES completion:nil];
    
   
}


#pragma mark TextView delegate method 

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (BOOL)shouldAutorotate
{
    if (deviceIdiom == iPhone) {
        return YES;
    } else {
        return YES;
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
}


#ifdef USE_EVENTKIT_DATA_SOURCE

- (NSArray *)weekView:(MAWeekView *)weekView eventsForDate:(NSDate *)startDate {
    return [self.eventKitDataSource weekView:weekView eventsForDate:startDate];
}

#else

static int counter = 7 * 5;

- (NSArray *)weekView:(MAWeekView *)weekView eventsForDate:(NSDate *)startDate {
	counter--;
	
	unsigned int r = arc4random() % 24;
	unsigned int r2 = arc4random() % 10;
	
	NSArray *arr;
	
	if (counter < 0) {
		arr = [NSArray arrayWithObjects: self.event, nil];
	} else {
		arr = (r <= 5 ? [NSArray arrayWithObjects: self.event, self.event, nil] : [NSArray arrayWithObjects: self.event, self.event, self.event, nil]);
		
		((MAEvent *) [arr objectAtIndex:1]).title = @"All-day events test";
		((MAEvent *) [arr objectAtIndex:1]).allDay = YES;
		
		if (r > 5) {
			((MAEvent *) [arr objectAtIndex:2]).title = @"Foo!";
			((MAEvent *) [arr objectAtIndex:2]).backgroundColor = [UIColor brownColor];
			((MAEvent *) [arr objectAtIndex:2]).allDay = YES;
		}
	}
	
	((MAEvent *) [arr objectAtIndex:0]).title = @"Event lorem ipsum es dolor test";
	
	NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:startDate];
	[components setHour:r];
	[components setMinute:0];
	[components setSecond:0];
	
	((MAEvent *) [arr objectAtIndex:0]).start = [CURRENT_CALENDAR dateFromComponents:components];
	
	[components setHour:r+1];
	[components setMinute:0];
	
	((MAEvent *) [arr objectAtIndex:0]).end = [CURRENT_CALENDAR dateFromComponents:components];
	
	if (r2 > 5) {
		((MAEvent *) [arr objectAtIndex:0]).backgroundColor = [UIColor brownColor];
	}
	
	return arr;
}

#endif

- (MAEvent *)event {
	static int counter;
	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	
	[dict setObject:[NSString stringWithFormat:@"number %i", counter++] forKey:@"test"];
	
	MAEvent *event = [[MAEvent alloc] init];
	event.backgroundColor = [UIColor purpleColor];
	event.textColor = [UIColor whiteColor];
	event.allDay = NO;
	event.userInfo = dict;
	return event;
}

- (MAEventKitDataSource *)eventKitDataSource {
    if (!_eventKitDataSource) {
        _eventKitDataSource = [[MAEventKitDataSource alloc] init];
    }
    return _eventKitDataSource;
}

/* Implementation for the MAWeekViewDelegate protocol */

- (void)weekView:(MAWeekView *)weekView eventTapped:(MAEvent *)event {
	NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:event.start];
	NSString *eventInfo = [NSString stringWithFormat:@"Event tapped: %02i:%02i. Userinfo: %@", [components hour], [components minute], [event.userInfo objectForKey:@"test"]];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:event.title
                                                    message:eventInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

- (void)weekView:(MAWeekView *)weekView eventDragged:(MAEvent *)event {
	NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:event.start];
	NSString *eventInfo = [NSString stringWithFormat:@"Event dragged to %02i:%02i. Userinfo: %@", [components hour], [components minute], [event.userInfo objectForKey:@"test"]];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:event.title
                                                    message:eventInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
