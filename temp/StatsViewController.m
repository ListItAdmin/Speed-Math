//
//  StatsViewController.m
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 9/1/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()

@property (strong) NSMutableArray *fetchResults;

@end

@implementation StatsViewController
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
- (float)calculateAverage:(NSString*)userName withOperator:(NSString*)operator withDifficulty:(NSString*)difficulty withGameType:(NSString*)gameType
{
    float avg;
    
    NSLog(@"userName: %@, operator: %@, difficulty: %@, gameType: %@", userName, operator, difficulty, gameType);
    
    // Calculate Avg
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Logfile"];
    self.fetchResults = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSString *whereClause = [NSString stringWithFormat: @"(username == '%@') AND (operator == '%@') AND (gametype == '%@') AND (difficulty == '%@')", userName, operator, gameType, difficulty];
    
    NSLog(@"Where: %@", whereClause);
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:whereClause];
    
    [fetchRequest setPredicate:pred];
    
    self.fetchResults = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"Log file size: %lu", (unsigned long)[self.fetchResults count]);
    
    int i;
    float sum=0;
    
    for (i = 0; i< [self.fetchResults count];i++)
    {
        sum=sum + [[[self.fetchResults objectAtIndex:i] valueForKey:@"score"] floatValue];
        
        NSLog(@"Score: %@", [[self.fetchResults objectAtIndex:i] valueForKey:@"score"]);
        
    }
    
    avg = sum/[self.fetchResults count];
    
    return avg;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *currentUser = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]];
    
    
    
    
    //Averages
    float avg;
    
    avg = [self calculateAverage:currentUser withOperator:@"Multiplication" withDifficulty:@"Easy" withGameType:@"10 Problems"];
    self.ME10.text = [NSString stringWithFormat:@"%1.2f",avg];
    
    
    
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

@end
