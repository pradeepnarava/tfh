//
//  EditUtmana.m
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 5/2/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import "EditUtmana.h"

@interface EditUtmana ()

@end

@implementation EditUtmana
@synthesize datefrome3,c1,c2,c3,c4,c5,c6;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}


- (void)viewDidLoad
{
    self.navigationItem.title=@"Exercise-3";
    NSLog(@"datefrome3%@",datefrome3);
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Dela"
                                                                    style:UIBarButtonItemStylePlain target:nil action:@selector(sharebutton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"exerciseDB.db"]];
    // const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    if (sqlite3_open([databasePath UTF8String], &exerciseDB) == SQLITE_OK) {
        
        NSString *sql = [NSString stringWithFormat: @"SELECT * FROM EXERCISE3 WHERE date='%@'", datefrome3];
        
        const char *del_stmt = [sql UTF8String];
        
        sqlite3_prepare_v2(exerciseDB, del_stmt, -1, & statement, NULL);
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            char* ch1 = (char*) sqlite3_column_text(statement,2);
          
            if (ch1 != NULL){
              c1.text = [NSString stringWithUTF8String:ch1];
                NSLog(@"value form db :%@",c1.text);
               
            }
            char* ch2 = (char*) sqlite3_column_text(statement,3);
           
            if (ch2 != NULL){
                c2.text = [NSString stringWithUTF8String:ch2];
                NSLog(@"value form db :%@",c2.text);
              
            }
            
            char* ch3 = (char*) sqlite3_column_text(statement,4);
           
            if (ch3!= NULL){
                c3.text= [NSString stringWithUTF8String:ch3];
                NSLog(@"value form db :%@",c3.text);
              
            }
            
            char* ch4 = (char*) sqlite3_column_text(statement,5);
           
            if (ch4 != NULL){
                c4.text= [NSString stringWithUTF8String:ch4];
                NSLog(@"value form db :%@",c4.text);
                
            }
            char* ch5 = (char*) sqlite3_column_text(statement,6);
            
            if (ch5!= NULL){
                c5.text= [NSString stringWithUTF8String:ch5];
                NSLog(@"value form db :%@",c5.text);
                
            }
            
            char* ch6 = (char*) sqlite3_column_text(statement,7);
            
            if (ch6 != NULL){
                c6.text= [NSString stringWithUTF8String:ch6];
                NSLog(@"value form db :%@",c6.text);
                
            }

            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(exerciseDB);
        
        
    }
    

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)updatebutton:(id)sender{
  //  (date,negative,dina,hur,motbevis,tankefalla,alternativ)
    NSLog(@"%@",datefrome3);
  
    sqlite3_stmt    *statement;
    if (sqlite3_open([databasePath UTF8String], &exerciseDB) == SQLITE_OK) {
        /*NSString *query=[NSString stringWithFormat:@"UPDATE EXERCISE3 SET  negative=%@,dina=%@, hur=%@, motbevis=%@, tankefalla=%@,alternativ=%@ WHERE date=%@",c1.text,c2.text, c3.text,c4.text, c5.text,c6.text,datefrome3];*/
        NSString *query=[NSString stringWithFormat:@"UPDATE EXERCISE3 SET  negative=%@,dina=%@, hur=%@, motbevis=%@, tankefalla=%@,alternativ=%@ WHERE date=%@",c1.text,c2.text, c3.text,c4.text, c5.text,c6.text,datefrome3];
        
        
        const char *del_stmt = [query UTF8String];
        
      if (sqlite3_prepare_v2(exerciseDB, del_stmt, -1, & statement, NULL)== SQLITE_ROW){
        
      NSLog(@"sss");
            
            
        }else{
            
        }
        
        
        sqlite3_finalize(statement);
        sqlite3_close(exerciseDB);
        
        
    }

}
-(IBAction)deletebutton:(id)sender{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert message" message:@"Erasing the form or not?"
                                                 delegate:self
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:@"Delete", nil];
    
    [alert show];
    [alert release];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        sqlite3_stmt    *statement;
        if (sqlite3_open([databasePath UTF8String], &exerciseDB) == SQLITE_OK) {
            
            NSString *sql = [NSString stringWithFormat: @"DELETE FROM EXERCISE3 WHERE date='%@'", datefrome3];
            
            const char *del_stmt = [sql UTF8String];
            
            sqlite3_prepare_v2(exerciseDB, del_stmt, -1, & statement, NULL);
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSLog(@"sss");
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(exerciseDB);
            
            
        }
        
        c1.text=@"";
        c2.text=@"";
        c3.text=@"0%";
        c4.text=@"";
        c5.text=@"";
        c6.text=@"";
        
    }else{
        
    }
}
-(IBAction)sharebutton:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [super dealloc];
    
}

@end
