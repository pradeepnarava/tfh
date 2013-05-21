//
//  Livskompassen.m
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/10/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import "Livskompassen.h"
#import "MTPopupWindow.h"
@interface Livskompassen ()

@end

@implementation Livskompassen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"Livskompassen";
    dr=[[Dinaomraden alloc]initWithNibName:@"Dinaomraden" bundle:nil];
    ev=[[ExampleView alloc]initWithNibName:@"ExampleView" bundle:nil];
    //[self.view addSubview:scrollView];
    //scrollView.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)pageB:(id)sender{

    [self.navigationController pushViewController:dr animated:YES];
}
-(IBAction)pageC:(id)sender{
 
     [self.navigationController pushViewController:ev animated:YES];
}
-(IBAction)iLabel:(id)sender{
     [MTPopupWindow showWindowWithHTMLFile:@"Livskompassen.html" insideView:self.view];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end