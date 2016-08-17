
//
//  MainMathViewController.m
//  Hello World
//
//  Created by Ollie, Neon Shoes on 6/20/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import "MainMathViewController.h"

@interface MainMathViewController ()
@property (strong) NSString *UserAnswer;
@property (nonatomic, assign) NSInteger maxprobcount;
@property (nonatomic, assign) NSInteger probcount;
@property (nonatomic, assign) NSInteger TimerCount;
@property (strong) NSTimer *timer1;
@property (nonatomic, assign) NSInteger TimerSeconds;
@property (nonatomic, assign) NSInteger TimerMinute;
@property (nonatomic, assign) NSInteger MinProbs;
@property (nonatomic, assign) NSInteger ProbNumCount;
@property (nonatomic, assign) NSInteger TimerMil;
@property (nonatomic, assign) NSInteger UpperRandom;
@property (nonatomic, assign) NSInteger LowerRandom;

@end

@implementation MainMathViewController

//***********************************************************************
// Setup ManagedObjectContext to access core data
//***********************************************************************
- (NSManagedObjectContext *)managedObjectContext
{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
    
}


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
    // Do any additional setup after loading the view.
    self.Answer.text=@"";
    self.Operator.text=@"+";
    self.maxprobcount=10;
}

//***********************************************************************
// viewDidAppear to get data to display into table view
//***********************************************************************fz
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    self.username.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    
    NSLog(@"ViewDidAppear");
    
    
}

- (void)DisplayTime{
    float OneMin;
    
    self.TimerCount=self.TimerCount+1;
    self.Timer.text=[NSString stringWithFormat:@"%ld",(long)self.TimerCount];
    if (self.TimerCount==100) {
        self.TimerCount=0;
        self.TimerSeconds=self.TimerSeconds+1;
        self.TimerSec.text=[NSString stringWithFormat:@"%ld",(long)self.TimerSeconds];
    if (self.TimerSeconds==60) {
        self.TimerSeconds=0;
        self.TimerMinute=self.TimerMinute+1;
        self.TimerMin.text=[NSString stringWithFormat:@"%ld",(long)self.TimerMinute];
        self.TimerSec.text=@"00";
        }
    if (self.MaxProbs.selectedSegmentIndex==2) {
        self.TimerMil=self.TimerMil+1;
            OneMin=(float)self.TimerSeconds/60;
       // NSLog(@"OneMin: %d",OneMin);
        self.Progress.progress=OneMin;

        if (self.TimerMinute==1) {
            self.ProbNum.text=@"";
            self.Stop_Reset.enabled=NO;
            [self.timer1 invalidate];
            self.Timer.text=@"00";
            self.Start.enabled=YES;
            self.Difficulty.enabled=YES;
            self.Type.enabled=YES;
            self.button1.enabled=NO;
            self.button2.enabled=NO;
            self.button3.enabled=NO;
            self.button4.enabled=NO;
            self.button5.enabled=NO;
            self.button6.enabled=NO;
            self.button7.enabled=NO;
            self.button8.enabled=NO;
            self.button9.enabled=NO;
            self.button0.enabled=NO;
            self.Clear.enabled=NO;
            self.AnswerButton.enabled=NO;
            self.probcount=0;
            self.label1.text=(@"Press");
            self.label2.text=(@"Start");
            self.MaxProbs.enabled=YES;
            [self.timer1 invalidate];
            self.Answer.text=@"";
            self.Progress.progress=0;
            //this is msg box
            NSString *msg1=[NSString stringWithFormat:@"The amount of problems that you did is: %ld",(long)self.MinProbs];
            UIAlertView *alert1=[[UIAlertView alloc] initWithTitle:@"SPEED MATH" message:msg1 delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
        }

        
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button1:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"1"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
        }
    }

- (IBAction)button2:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"2"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button3:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"3"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button4:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"4"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button5:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"5"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button6:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"6"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button7:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"7"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button8:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"8"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button9:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"9"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)button0:(id)sender {
    if ([self.Answer.text length]<4) {
        NSString *answer=[NSString stringWithFormat:@"%@%s",self.Answer.text,"0"];
        self.Answer.text=answer;
        self.UserAnswer=self.Answer.text;
    }
}

- (IBAction)AnswerButton:(id)sender {
  
    float CurrentProgress;
    
    if (self.Difficulty.selectedSegmentIndex==0) {
        self.UpperRandom=9;
        self.LowerRandom=1;
    }
    else if (self.Difficulty.selectedSegmentIndex==1) {
        self.UpperRandom=13;
        self.LowerRandom=1;
    }
    else if (self.Difficulty.selectedSegmentIndex==2) {
        self.UpperRandom=20;
        self.LowerRandom=5;
    }

    self.Answer.text=@"";
    NSLog(@"Operator: %@", self.Operator.text);
    NSLog(@"user answer (from screen): %@", self.UserAnswer);

    int Answer_int;
    int CorrectAnswer_int;
    int label1_int;
    int label2_int;
    //int label1Division;
    //int label2Division;
    
    if ([self.Operator.text isEqualToString:@"+"]) {
        label1_int = [self.label1.text intValue];
        
        label2_int = [self.label2.text intValue];
        
        Answer_int = [self.UserAnswer intValue];
        CorrectAnswer_int = label1_int + label2_int;
    } else if ([self.Operator.text isEqualToString:@"-"]) {
        label1_int = [self.label1.text intValue];
        label2_int = [self.label2.text intValue];
        Answer_int = [self.UserAnswer intValue];
        CorrectAnswer_int = label1_int - label2_int;
    } else if ([self.Operator.text isEqualToString:@"x"]) {
        label1_int = [self.label1.text intValue];
        label2_int = [self.label2.text intValue];
        Answer_int = [self.UserAnswer intValue];
        CorrectAnswer_int = label1_int * label2_int;
    } else if ([self.Operator.text isEqualToString:@"÷"]) {
        
        label1_int = [self.label1.text intValue];
        label2_int = [self.label2.text intValue];
        Answer_int = [self.UserAnswer intValue];
        CorrectAnswer_int = label1_int / label2_int;
    }

    NSLog(@"Correct answer: %d",CorrectAnswer_int);
    NSLog(@"User answer: %d",Answer_int);
    
        if (CorrectAnswer_int == Answer_int) {
            self.ProbNumCount=self.ProbNumCount+1;
            self.ProbNum.text=[NSString stringWithFormat:@"%ld)",(long)self.ProbNumCount];
                //update progress bar
            CurrentProgress=(float)(self.ProbNumCount-1)/self.maxprobcount;
            self.Progress.progress=CurrentProgress;
            
            NSLog(@"correct");
            self.MinProbs=self.MinProbs+1;
            self.label1.textColor = [UIColor blackColor];
            self.label2.textColor = [UIColor blackColor];
            self.Operator.textColor = [UIColor blackColor];
            //int r1=(arc4random() %self.UpperRandom)+self.LowerRandom;
            //int r2=(arc4random() %self.UpperRandom)+self.LowerRandom;
            
            long r1_long=(arc4random() %self.UpperRandom)+self.LowerRandom;
            long r2_long=(arc4random() %self.UpperRandom)+self.LowerRandom;
            
            int r1 = (int)r1_long;
            int r2 = (int)r2_long;
            
            int Answer =r1*r2;
            NSString *r1_string=[NSString stringWithFormat:@"%d",r1];
            NSString *r2_string=[NSString stringWithFormat:@"%d",r2];
            NSString *Answer_string=[NSString stringWithFormat:@"%d", Answer];
            if (self.Type.selectedSegmentIndex==3) {
                self.label1.text = Answer_string;
                self.label2.text = r1_string;
            } else {
                
                if (r1>r2) {
                    self.label1.text = r1_string;
                    self.label2.text = r2_string;
                } else {
                    self.label1.text = r2_string;
                    self.label2.text = r1_string;
                }
                
            }
            if (self.MathType.selectedSegmentIndex==4) {
                int MixedType=arc4random() %4;
                if (MixedType==0) {
                    self.Operator.text=@"+";
                }
                if (MixedType==1) {
                    self.Operator.text=@"-";
                }
                if (MixedType==2) {
                    self.Operator.text=@"x";
                }
                if (MixedType==3) {
                    self.Operator.text=@"÷";
                    self.label1.text = Answer_string;
                    self.label2.text = r1_string;
                }
            }


            NSLog(@"probcount: %ld",(long)self.probcount);

            self.probcount=self.probcount+1;
 //           self.probcount=self.probcount/4;
            NSLog(@"probcount: %ld",(long)self.probcount);
           if (self.probcount==self.maxprobcount) {
               self.ProbNum.text=@"";
                NSLog(@"done");
               self.Start.enabled=YES;
               self.Difficulty.enabled=YES;
               self.Type.enabled=YES;
               self.button1.enabled=NO;
               self.button2.enabled=NO;
               self.button3.enabled=NO;
               self.button4.enabled=NO;
               self.button5.enabled=NO;
               self.button6.enabled=NO;
               self.button7.enabled=NO;
               self.button8.enabled=NO;
               self.button9.enabled=NO;
               self.button0.enabled=NO;
               self.Clear.enabled=NO;
               self.AnswerButton.enabled=NO;
               self.probcount=0;
               self.label1.text=(@"Press");
               self.label2.text=(@"Start");
               self.MaxProbs.enabled=YES;
               [self.timer1 invalidate];
               self.Stop_Reset.enabled=NO;
               self.Progress.progress=0;
               
               //record game results to database
               // Create a new managed object
               NSManagedObjectContext *context = [self managedObjectContext];
               NSManagedObject *newlog = [NSEntityDescription insertNewObjectForEntityForName:@"LogFile" inManagedObjectContext:context];
               NSDate *now = [NSDate date];
               
               NSString *currentUser = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]];
               
               [newlog setValue: [NSNumber numberWithInteger:10] forKey:@"score"];
               [newlog setValue:[NSString stringWithFormat:@"%@",currentUser] forKey:@"userid"];
               [newlog setValue:[NSString stringWithFormat:@"10q"]forKey:@"gametype"];
               [newlog setValue:[NSString stringWithFormat:@"easy"] forKey:@"level"];
               [newlog setValue:[NSString stringWithFormat:@"addition"] forKey:@"operator"];
               [newlog setValue:now forKey:@"timestamp"];
               
               NSError *error = nil;
               // Save the object to data base
               if (![context save:&error]) {
                   NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
               }

            

               
               //this is msg box
               NSString *msg=[NSString stringWithFormat:@"You did it!"];
               UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"SPEED MATH" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
               [alert show];
        }
    
        } else {
            NSLog(@"incorrect");
            self.label1.textColor = [UIColor redColor];
            self.label2.textColor = [UIColor redColor];
            self.Operator.textColor = [UIColor redColor];
        } // end if CorrectAnswer
     
     
} //end AnswerButton

- (IBAction)Clear:(id)sender {
    self.Answer.text=@"";
}

- (IBAction)MathType:(id)sender {
    if (self.MathType.selectedSegmentIndex==0) {
        self.Operator.text=@"+";
    } else if (self.MathType.selectedSegmentIndex==1){
        self.Operator.text=@"-";
    } else if (self.MathType.selectedSegmentIndex==2){
        self.Operator.text=@"x";
    } else if (self.MathType.selectedSegmentIndex==3){
        self.Operator.text=@"÷";
    } else if (self.MathType.selectedSegmentIndex==4){
        self.Operator.text=@"";
    }
}
- (IBAction)Start:(id)sender {
    if (self.Difficulty.selectedSegmentIndex==0) {
        self.UpperRandom=9;
        self.LowerRandom=1;
    }
    else if (self.Difficulty.selectedSegmentIndex==1) {
        self.UpperRandom=13;
    self.LowerRandom=1;
    }
    else if (self.Difficulty.selectedSegmentIndex==2) {
        self.UpperRandom=20;
        self.LowerRandom=5;
    }


    long r1_long = (arc4random() %self.UpperRandom)+self.LowerRandom;
    long r2_long = (arc4random() %self.UpperRandom)+self.LowerRandom;
    
    
    int r1=(int)r1_long;
    int r2=(int)r2_long;
    
    //(arc4random() % 49) + 1;
    //int r1 = arc4random()%10;
    //int r2 = arc4random()%10;
    int Answer = r1*r2;
    self.Timer1=[NSTimer scheduledTimerWithTimeInterval:0.01
                                     target:self
                                   selector:@selector(DisplayTime)
                                   userInfo:nil
                                    repeats:YES];

    NSLog(@"random number: %d,%d",r1,r2);
    NSString *r1_string=[NSString stringWithFormat:@"%d",r1];
    NSString *r2_string=[NSString stringWithFormat:@"%d",r2];
    NSString *Answer_string=[NSString stringWithFormat:@"%d", Answer];
    if (self.Type.selectedSegmentIndex==3) {
        self.label1.text = Answer_string;
        self.label2.text = r1_string;
    } else {
        
    if (r1>r2) {
            self.label1.text = r1_string;
            self.label2.text = r2_string;
        } else {
            self.label1.text = r2_string;
            self.label2.text = r1_string;
        }

    }
    if (self.MathType.selectedSegmentIndex==4) {
        int MixedType=arc4random() %4;
        NSLog(@"MixedType: %d", MixedType);
        if (MixedType==0) {
            self.Operator.text=@"+";
        }
        if (MixedType==1) {
            self.Operator.text=@"-";
        }
        if (MixedType==2) {
            self.Operator.text=@"x";
        }
        if (MixedType==3) {
            self.Operator.text=@"÷";
            self.label1.text = Answer_string;
            self.label2.text = r1_string;
       }
    }
    
        self.Start.enabled=NO;
    self.Difficulty.enabled=NO;
    self.Type.enabled=NO;
    self.button1.enabled=YES;
    self.button2.enabled=YES;
    self.button3.enabled=YES;
    self.button4.enabled=YES;
    self.button5.enabled=YES;
    self.button6.enabled=YES;
    self.button7.enabled=YES;
    self.button8.enabled=YES;
    self.button9.enabled=YES;
    self.button0.enabled=YES;
    self.Clear.enabled=YES;
    self.AnswerButton.enabled=YES;
    self.MaxProbs.enabled=NO;
    self.probcount=0;
    self.TimerCount=0;
    self.TimerSeconds=0;
    self.TimerMinute=0;
    self.TimerSec.text=@"00";
    self.TimerMin.text=@"00";
    self.MinProbs=0;
    self.ProbNum.text=@"1)";
    self.Progress.progress=0;
    self.ProbNumCount=1;
    self.Stop_Reset.enabled=YES;
}

- (IBAction)MaxProbs:(id)sender {
    
    if (self.MaxProbs.selectedSegmentIndex==0) {
        self.maxprobcount=10;
    } else if (self.MaxProbs.selectedSegmentIndex==1){
        self.maxprobcount=50;
    } else if (self.MaxProbs.selectedSegmentIndex==2){
        self.maxprobcount=999;
        
    /*} else if (self.MaxProbs.selectedSegmentIndex==3){
        self.maxprobcount=40;
    } else if (self.MaxProbs.selectedSegmentIndex==4){
        self.maxprobcount=50;
    } else if (self.MaxProbs.selectedSegmentIndex==5)
        self.maxprobcount=999;*/
    }

}


- (IBAction)Stop:(id)sender {
    self.ProbNum.text=@"";
    self.Start.enabled=YES;
    self.Difficulty.enabled=YES;
    self.Type.enabled=YES;
    self.button1.enabled=NO;
    self.button2.enabled=NO;
    self.button3.enabled=NO;
    self.button4.enabled=NO;
    self.button5.enabled=NO;
    self.button6.enabled=NO;
    self.button7.enabled=NO;
    self.button8.enabled=NO;
    self.button9.enabled=NO;
    self.button0.enabled=NO;
    self.Clear.enabled=NO;
    self.AnswerButton.enabled=NO;
    self.probcount=0;
    self.label1.text=(@"Press");
    self.label2.text=(@"Start");
    self.MaxProbs.enabled=YES;
    [self.timer1 invalidate];
    self.Stop_Reset.enabled=NO;
    self.Answer.text=@"";
    self.Timer.text=@"00";
    self.TimerSec.text=@"00";
    self.TimerMin.text=@"00";
    self.Progress.progress=0;
    self.TimerMil=0;
    self.label1.textColor = [UIColor blackColor];
    self.label2.textColor = [UIColor blackColor];
    self.Operator.textColor = [UIColor blackColor];

}
- (IBAction)Difficulty:(id)sender {
}


- (IBAction)reset:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newUser01 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [newUser01 setValue:[NSNumber numberWithInteger:1] forKey:@"userid"];
    [newUser01 setValue:[NSString stringWithFormat:@"Ollie"] forKey:@"username"];
    [newUser01 setValue:[NSString stringWithFormat:@"Ryan"] forKey:@"firstname"];
    [newUser01 setValue:[NSString stringWithFormat:@"Hom"] forKey:@"lastname"];
    [newUser01 setValue:[NSString stringWithFormat:@"Chadwick"] forKey:@"school"];
    
    NSManagedObject *newUser02 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [newUser02 setValue:[NSNumber numberWithInteger:2] forKey:@"userid"];
    [newUser02 setValue:[NSString stringWithFormat:@"Mommy-mo"] forKey:@"username"];
    [newUser02 setValue:[NSString stringWithFormat:@"Ida"] forKey:@"firstname"];
    [newUser02 setValue:[NSString stringWithFormat:@"Chen"] forKey:@"lastname"];
    [newUser02 setValue:[NSString stringWithFormat:@"UCLA"] forKey:@"school"];
    
    NSManagedObject *newUser03 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [newUser03 setValue:[NSNumber numberWithInteger:3] forKey:@"userid"];
    [newUser03 setValue:[NSString stringWithFormat:@"Daddio"] forKey:@"username"];
    [newUser03 setValue:[NSString stringWithFormat:@"Ron"] forKey:@"firstname"];
    [newUser03 setValue:[NSString stringWithFormat:@"Hom"] forKey:@"lastname"];
    [newUser03 setValue:[NSString stringWithFormat:@"UCLA"] forKey:@"school"];
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    
    NSString *msg = [NSString stringWithFormat:@"Database was reset successfully."];
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"DATABASE MANAGER" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}
- (IBAction)Statistics:(id)sender {
}
@end























