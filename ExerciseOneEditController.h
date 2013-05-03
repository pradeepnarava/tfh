//
//  ExerciseOneEditController.h
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 4/30/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>



@interface ExerciseOneEditController : UIViewController{
    NSString *selectedate;
    sqlite3 *exerciseDB;
    NSString *databasePath;
    UITextView *situation;
    UITextView *negative;
    UITextView *overiga;
    UITextView *beteenden;
}
@property(nonatomic, retain)NSString *selectedate;
-(IBAction)updatebutton:(id)sender;
-(IBAction)deletebutton:(id)sender;
@property(nonatomic,retain)IBOutlet UITextView *situation;
@property(nonatomic,retain)IBOutlet UITextView *negative;
@property(nonatomic,retain)IBOutlet UITextView *overiga;
@property(nonatomic,retain)IBOutlet UITextView *beteenden;
@end
