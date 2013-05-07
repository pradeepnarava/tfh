//
//  Registreratankar.m
//  Välkommen till TFH-appen
//
//  Created by Mohammed Abdul Majeed on 4/29/13.
//  Copyright (c) 2013 brilliance. All rights reserved.
//

#import "Registreratankar.h"
#import "MTPopupWindow.h"

#define kAlertViewOne 1
#define kAlertViewTwo 2

@interface Registreratankar ()

@end

@implementation Registreratankar
@synthesize label,flykt,tanke,tabellen,nat;
@synthesize negative,situation,beteenden,overiga,alert;
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
   
    self.navigationItem.title=@"Registrera tankar";
    eevc=[[EditExerciseViewController alloc]initWithNibName:@"EditExerciseViewController" bundle:nil];
    UIBarButtonItem *bButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = bButton;
    
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainlabelalert:)] autorelease];
    [label addGestureRecognizer:tapGesture];
    
    nat.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture2 =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(natalert:)] autorelease];
    [nat addGestureRecognizer:tapGesture2];
    
    tabellen.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture3 =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabellenalert:)] autorelease];
    [tabellen addGestureRecognizer:tapGesture3];
    
    tanke.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture4 =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tankealert:)] autorelease];
    [tanke addGestureRecognizer:tapGesture4];
    
    flykt.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture5 =
    [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flyktalert:)] autorelease];
    [flykt addGestureRecognizer:tapGesture5];
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"exerciseDB.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == YES)
    {
		const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &exerciseDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS EXERCISEONE (ID INTEGER PRIMARY KEY AUTOINCREMENT, DATE TEXT,  NEGATIVE TEXT ,SITUATION TEXT,BETEENDEN TEXT, OVERIGA TEXT)";
            
            if (sqlite3_exec(exerciseDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create database");
            }
            
            sqlite3_close(exerciseDB);
            
        } else {
            //status.text = @"Failed to open/create database";
        }
    }
    
    [filemgr release];

    [super viewDidLoad]; 
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)mainlabelalert:(id)sender{
     [MTPopupWindow showWindowWithHTMLFile:@"lashorna.html" insideView:self.view];
}

-(IBAction)natalert:(id)sender{
    [MTPopupWindow showWindowWithHTMLFile:@"tanke.html" insideView:self.view];
}
-(IBAction)tabellenalert:(id)sender{
    [MTPopupWindow showWindowWithHTMLFile:@"lashorna.html" insideView:self.view];
}
-(IBAction)tankealert:(id)sender{
    [MTPopupWindow showWindowWithHTMLFile:@"tanke.html" insideView:self.view];
}
-(IBAction)flyktalert:(id)sender{
    [MTPopupWindow showWindowWithHTMLFile:@"flykt.html" insideView:self.view];
}
-(IBAction)Sparabutton:(id)sender{
    NSDate* date = [NSDate date];
    
    //Create the dateformatter object
    
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    //Set the required date format
    
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    
    //Get the string date
    
    NSString* str = [formatter stringFromDate:date];
    
    NSLog(@"date%@",str);
    
    if([negative.text isEqualToString:@""]){
       
        
    }else if([situation.text isEqualToString:@""]){
       
    }else if([beteenden.text isEqualToString:@""]){
      
    }else if([overiga.text isEqualToString:@""]){
       
    }else{
        NSLog(@"yes");
        sqlite3_stmt    *statement;
        
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &exerciseDB) == SQLITE_OK)
        {
            NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO EXERCISEONE (date,negative,situation,beteenden,overiga) VALUES (\"%@\", \"%@\", \"%@\" ,\"%@\",\"%@\")", str, negative.text,situation.text, beteenden.text , overiga.text];
            
            const char *insert_stmt = [insertSQL UTF8String];
            
            sqlite3_prepare_v2(exerciseDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
             
                situation.text = @"";
                negative.text = @"";
                overiga.text = @"";
                beteenden.text=@"";
                
                
            } else {
                NSLog(@"no");
            }
            sqlite3_finalize(statement);
            sqlite3_close(exerciseDB);
        }

    }
            

    
}

-(IBAction)nyttbutton:(id)sender{
    
    if([situation.text isEqualToString:@""] || [negative.text isEqualToString:@""] || [overiga.text isEqualToString:@""] || [beteenden.text isEqualToString:@""]){
   
    }else{
        alert=[[UIAlertView alloc] initWithTitle:@"Alert message" message:@"Please Enter the text above fields"
                                        delegate:self
                               cancelButtonTitle:@"Cancel"
                               otherButtonTitles:@"without saving", nil];
        alert.tag=kAlertViewOne;
        [alert show];
        [alert release];
    }
    
    
}
-(IBAction)retrivebutton:(id)sender{
   /* const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &exerciseDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT negative FROM EXERCISEONE"
                              ];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(exerciseDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                char* date = (char*) sqlite3_column_text(statement,0);
                NSString *tmp;
                if (date != NULL){
                    tmp = [NSString stringWithUTF8String:date];
                    NSLog(@"value form db :%@",tmp);
                    
                }
            } 
            sqlite3_finalize(statement);
        }
        sqlite3_close(exerciseDB);
    }
*/
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
     NSLog(@"ok");
    if(alert.tag  == kAlertViewOne) {
        if (buttonIndex == 1) {
            NSLog(@"new form");
            situation.text = @"";
            negative.text = @"";
            overiga.text = @"";
            beteenden.text=@"";
            
        }else{
           
        }
    } else{
        
    }
}
-(IBAction)Editbutton:(id)sender{
    [self.navigationController pushViewController:eevc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
