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
@property (nonatomic, assign) NSString *scb;
@property (nonatomic, assign) NSMutableArray *arr1;
@property (nonatomic, assign) NSMutableArray *arr2;
@property (nonatomic, assign) NSMutableArray *arr3;
@end

@implementation Interoceptivexponering
@synthesize ovning,egen,slider,tblView,prc,scb,arr1,arr2,arr3;
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
-(void)dealloc{
    [super dealloc];
    [timerview release];
    [pupview release];
    [arr3 release];
    [arr2 release];
    [arr1 release];
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
       arr1=[[NSMutableArray alloc]init];
       arr2=[[NSMutableArray alloc]init];
    arr3=[[NSMutableArray alloc]init];
    [self.view addSubview:pupview];
    [self.view addSubview:timerview];
    pupview.hidden=YES;
    timerview.hidden=YES;
    noOfSection = 1;
    [arr1 insertObject:@"" atIndex:0];
    [arr2 insertObject:@"" atIndex:0];
    [arr3 insertObject:@"" atIndex:0];
    
      
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
//   
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
    [self.view bringSubviewToFront:timerview];
    timerview.hidden = NO;
    
    [UIView beginAnimations:@"curlInView" context:nil];
    
    [UIView setAnimationDuration:3.0];
    
    [UIView commitAnimations];
   
    
    self.secondsDisplay.text = [NSString
                                stringWithFormat:@"%d", self.seconds];
    
    self.minutesDisplay.text = [NSString
                                stringWithFormat:@"%d", self.minutes];

}
- (IBAction)closetimer:(id)sender{
    timerview.hidden=YES;
    ovning.text=scb;
  
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
-(IBAction)selectedcheckbox:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag == 1)
    {
        NSLog(@"%@",scb);
        if (scb == NULL) {
            [cb1 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
            scb=@"Skaka huvudet (30 sek)";
            NSLog(@"scb%@",scb);
            self.seconds=30;
        }
      
    }else if(btn.tag == 2){
            if (scb == NULL) {
        [cb2 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
       scb=@"Tajta kläder (60 min)";
        NSLog(@"scb%@",scb);
                self.minutes=60;
            }
    }else if(btn.tag == 3){
            if (scb == NULL) {
        [cb3 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
        scb=@"Huvudet mellan benen (90 sek)";
        NSLog(@"scb%@",scb);
                self.seconds=30;
                self.minutes=1;
            }
    }else if(btn.tag == 4){
            if (scb == NULL) {
        [cb4 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
      scb=@"Spring på stället (2 min)";
        NSLog(@"scb%@",scb);
                self.minutes=2;
            }
    }else if(btn.tag == 5){
            if (scb == NULL) {
        [cb5 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
       scb=@"Fullständig kroppsspänning (1 min)";
        NSLog(@"scb%@",scb);
                self.minutes=1;
                
            }
    }else if(btn.tag == 6){
            if (scb == NULL) {
        [cb6 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
       scb=@"Hålla andan (30 sek)";
        NSLog(@"scb%@",scb);
                self.seconds=30;
            }
    }else if(btn.tag == 7){
            if (scb == NULL) {
        [cb7 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
        scb=@"Hyperventilera (90 sek)";
        NSLog(@"scb%@",scb);
                self.seconds=30;
                self.minutes=1;
            }
    }else if(btn.tag == 8){
            if (scb == NULL) {
        [cb8 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
     scb=@"Svälj snabbt (fem gånger)";
        NSLog(@"scb%@",scb);
            }
    }else if(btn.tag == 9){
            if (scb == NULL) {
        [cb9 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
        scb=@"Drick kaffe";
        NSLog(@"scb%@",scb);
            }
    }else if(btn.tag == 10){
            if (scb == NULL) {
        [cb10 setImage:[UIImage imageNamed:@"check.png"]  forState:UIControlStateNormal];
       scb=@"Vatten i munnen (2 min)";
        NSLog(@"scb%@",scb);
                self.minutes=2;
            }
    }else{
        
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
     NSUInteger row = [indexPath row];
    // Deciding which data to put into this particular cell.
    // If it the first row, the data input will be "Data1" from the array.
    ovning=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
    ovning.font = [UIFont systemFontOfSize:12.0];
    ovning.textColor=[UIColor blackColor];
    ovning.numberOfLines = 4;

        NSLog(@"%@",arr1);
        ovning.text=[arr1 objectAtIndex:row];
   
   
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
  
            egen.text=[arr2 objectAtIndex:row];
             
            

    egen.delegate = self;
  
    [cell.contentView addSubview:egen];
    [egen release];
    prc=[[UILabel alloc] initWithFrame:CGRectMake(270, 0, 40, 30)];
    prc.font = [UIFont systemFontOfSize:12.0];
    prc.textColor=[UIColor blackColor];
    
    
    prc.text=[arr3 objectAtIndex:row];
    
    [cell.contentView addSubview:prc];
    NSString *ss=prc.text;
    float fCost = [ss floatValue];
    slider=[[UISlider alloc] initWithFrame:CGRectMake(200, 0, 90, 80)];
    [slider addTarget:self action:@selector(updateside:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.continuous = YES;
    slider.value = fCost;
           [cell.contentView addSubview:slider];
    [slider release];
    
        
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
    [arr1 insertObject:scb atIndex:noOfSection-1];
         NSLog(@"%@",arr1);
    [arr2 insertObject:egen.text atIndex:noOfSection-1];
     NSLog(@"%@",arr2);
     [arr3 insertObject:prc.text atIndex:noOfSection-1];
      NSLog(@"%@",arr3);
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
