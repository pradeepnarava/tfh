//
//  Interoceptivexponering.m
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/6/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import "Interoceptivexponering.h"
#import "MTPopupWindow.h"
@interface Interoceptivexponering ()
@property (nonatomic, assign) int seconds;
@property (nonatomic, assign) int minutes;
@end

@implementation Interoceptivexponering
@synthesize ovning,egen,slider,tblView,prc;
@synthesize secondsDisplay;
@synthesize minutesDisplay;
@synthesize secondsTimer;
@synthesize seconds;
@synthesize minutes;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tblView reloadData];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:pupview];
    [self.view addSubview:timerview];
    pupview.hidden=YES;
    timerview.hidden=YES;
    noOfSection = 1;
   }
- (void) timerFireMethod:(NSTimer *) theTimer
{
    
        if(self.seconds ==0 && self.minutes ==0){
            
        }else{
            self.seconds--;
            if (self.seconds == 0 && self.minutes != 0) {
            self.minutes--;
            self.seconds = 60;
        }
        
    }
    
    self.secondsDisplay.text = [NSString
                                stringWithFormat:@"%d", self.seconds];
    
    self.minutesDisplay.text = [NSString
                                stringWithFormat:@"%d", self.minutes];
}
// (listing continues)


-(IBAction)ovninglabelalert:(id)sender{
//    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Välj övning:"
//                                                      message:nil
//                                                     delegate:self
//                                            cancelButtonTitle:@"Gör övningen"
//                                            otherButtonTitles:nil];
//    UIButton *newButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40, 40)];
//    [newButton setTag:0];
//     [newButton setImage:[UIImage imageNamed:@"uncheck.png"]  forState:UIControlStateNormal];
//    [message addSubview:newButton];
//    
//    [message show];
    [self.view bringSubviewToFront:pupview];
    pupview.hidden = NO;
    
      
    [UIView beginAnimations:@"curlInView" context:nil];
    
    [UIView setAnimationDuration:3.0];
    
    [UIView commitAnimations];
    
    //[MTPopupWindow showWindowWithHTMLFile:@"Beteendeaktivering.html" insideView:self.view];
}
- (IBAction)closeBtn:(id)sender
{
    pupview.hidden=YES;
    timerview.hidden=NO;
    self.seconds = 30;
    self.minutes = 1;
    self.secondsDisplay.text = [NSString
                                stringWithFormat:@"%d", self.seconds];
    
    self.minutesDisplay.text = [NSString
                                stringWithFormat:@"%d", self.minutes];

}
- (IBAction)closetimer:(id)sender{
    timerview.hidden=YES;
    ovning.text=@"Hyperventilera (90 sek)";
}
- (IBAction)starttimer:(id)sender{
    self.secondsTimer = [NSTimer
                         scheduledTimerWithTimeInterval:1.0
                         target:self
                         selector:@selector(timerFireMethod:)
                         userInfo:nil
                         repeats:YES];
}
- (IBAction)stoptimer:(id)sender{
    [self.secondsTimer invalidate];
    self.secondsTimer= nil;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Button 1"])
    {
        NSLog(@"Button 1 was selected.");
    }
    else if([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 was selected.");
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
        return 60;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return noOfSection;
}

// This will tell your UITableView what data to put in which cells in your table.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifer = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    // Using a cell identifier will allow your app to reuse cells as they come and go from the screen.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    // Deciding which data to put into this particular cell.
    // If it the first row, the data input will be "Data1" from the array.
    ovning=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
    ovning.font = [UIFont systemFontOfSize:12.0];
    ovning.textColor=[UIColor blackColor];
    ovning.numberOfLines = 4;
    
    ovning.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ovninglabelalert:)] autorelease];
    [ovning addGestureRecognizer:tapGesture];
    [cell.contentView addSubview:ovning];
    [ovning release];
    
    
    egen=[[UITextView alloc] initWithFrame:CGRectMake(90, 0, 100, 60)];
    egen.font = [UIFont systemFontOfSize:12.0];
    egen.textColor=[UIColor blackColor];
    egen.keyboardType = UIKeyboardTypeDefault;
    egen.returnKeyType = UIReturnKeyDone;
    
    egen.delegate = self;
    
    [cell.contentView addSubview:egen];
    [egen release];
    
    slider=[[UISlider alloc] initWithFrame:CGRectMake(200, 0, 90, 80)];
    [slider addTarget:self action:@selector(updateside:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.continuous = YES;
    slider.value = 0;
           [cell.contentView addSubview:slider];
    [slider release];
    
    prc=[[UILabel alloc] initWithFrame:CGRectMake(270, 0, 40, 30)];
    prc.font = [UIFont systemFontOfSize:12.0];
    prc.textColor=[UIColor blackColor];
 
    prc.text=@"10%";
    [cell.contentView addSubview:prc];
    
    return cell;
}
-(IBAction)updateside:(id)sender
{
    slider = (UISlider*)sender;
    NSLog(@"Slider Value: %.1f", [slider value]);
    NSNumber *myNumber = [NSNumber numberWithDouble: [slider value]];
    NSInteger myInt = [myNumber intValue];
    NSString *inStr = [NSString stringWithFormat:@"%d", myInt];
    inStr = [inStr stringByAppendingString:@" %"];
    prc.text=inStr;
    NSLog(@"inStr Value: %@", inStr);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Upon selecting an event, create an EKEventViewController to display the event.
	//NSDictionary *dictionary = [self.listexercise1 objectAtIndex:indexPath.row];
    //NSLog(@"%@",dictionary);
   // NSString *SelectedDate=[NSString stringWithFormat:@"%@", dictionary];
   // NSLog(@"%@",SelectedDate);
   // Selectedrow=SelectedDate;
}
-(IBAction)newcolm:(id)sender{
    noOfSection++;
    NSLog(@"noof sections  %d",noOfSection);
    [self.tblView reloadData];
}
- (void)viewDidUnload{
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
