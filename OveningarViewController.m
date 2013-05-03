//
//  OveningarViewController.m
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 4/29/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import "OveningarViewController.h"

@interface OveningarViewController ()

@end

@implementation OveningarViewController

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
    self.navigationItem.title=@"Övningar";
    rt=[[Registreratankar alloc]initWithNibName:@"Registreratankar" bundle:nil];
    tfvc=[[TankefallorViewController alloc]initWithNibName:@"TankefallorViewController" bundle:nil];
    ut=[[Utmanatankar alloc]initWithNibName:@"Utmanatankar" bundle:nil];
    bec=[[BeteendeexperimentController alloc]initWithNibName:@"BeteendeexperimentController" bundle:nil];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)exercise1:(id)sender{
    [self.navigationController pushViewController:rt animated:YES];
}
-(IBAction)exercise2:(id)sender{
    [self.navigationController pushViewController:tfvc animated:YES];
}
-(IBAction)exercise3:(id)sender{
    [self.navigationController pushViewController:ut animated:YES];
}
-(IBAction)exercise4:(id)sender{
    [self.navigationController pushViewController:bec animated:YES];
}
@end
