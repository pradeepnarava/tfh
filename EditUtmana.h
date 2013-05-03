//
//  EditUtmana.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/2/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface EditUtmana : UIViewController{
    NSString *datefrome3;
    sqlite3 *exercise3DB;
    NSString *databasePath;
    UITextView *c1,*c2,*c4,*c5,*c6;
    UILabel *c3;
}

@property(nonatomic, retain)NSString *datefrome3;
@property(nonatomic, retain)IBOutlet UITextView *c1;
@property(nonatomic, retain)IBOutlet UITextView *c2;
@property(nonatomic, retain)IBOutlet UITextView *c4;
@property(nonatomic, retain)IBOutlet UITextView *c5;
@property(nonatomic, retain)IBOutlet UITextView *c6;
@property(nonatomic, retain)IBOutlet UILabel *c3;
-(IBAction)updatebutton:(id)sender;
-(IBAction)deletebutton:(id)sender;
@end
