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
    scroll.scrollEnabled = YES;
    [scroll setContentSize:CGSizeMake(320, 700)];
  self.navigationItem.title=@"Övningar";
    rt=[[Registreratankar alloc]initWithNibName:@"Registreratankar" bundle:nil];
    tfvc=[[TankefallorViewController alloc]initWithNibName:@"TankefallorViewController" bundle:nil];
    ut=[[Utmanatankar alloc]initWithNibName:@"Utmanatankar" bundle:nil];
    bec=[[BeteendeexperimentController alloc]initWithNibName:@"BeteendeexperimentController" bundle:nil];
    ba=[[Beteendeaktivering alloc]initWithNibName:@"Beteendeaktivering" bundle:nil];
    ice=[[Interoceptivexponering alloc]initWithNibName:@"Interoceptivexponering" bundle:nil];
    lsp=[[Livskompassen alloc]initWithNibName:@"Livskompassen" bundle:nil];
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        NSLog(@"Ipad ");
//           self.viewController = [[OveningarViewController alloc] initWithNibName:@"OveningarViewController_iPad" bundle:nil];
//    }
//    else
//    {
//        NSLog(@"Iphone %f ",[[UIScreen mainScreen] bounds].size.height);
//        if ([[UIScreen mainScreen] bounds].size.height == 568) {
//               self.viewController = [[OveningarViewController alloc] initWithNibName:@"OveningarViewController" bundle:nil];
//           
//            //this is iphone 5 xib
//        } else {
//          // self.viewController=[[NSString alloc]initWithString:@"ViewController"];
//            // this is iphone 4 xib
//        }
//    }
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"tillbaka"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    //UIImage *stretchable = [UIImage imageNamed:@"backbutton.png"] ;
  //  [backButton setBackgroundImage:stretchable forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = backButton;
     
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
-(IBAction)exercise5:(id)sender{
    [self.navigationController pushViewController:ice animated:YES];
}
-(IBAction)exercise6:(id)sender{
    [self.navigationController pushViewController:ba animated:YES];
}
-(IBAction)exercise7:(id)sender{
    [self.navigationController pushViewController:lsp animated:YES];
}
@end
