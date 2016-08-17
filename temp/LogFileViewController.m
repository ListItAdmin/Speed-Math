//
//  LogFileViewController.m
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/30/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import "LogFileViewController.h"
#import "LogFileCell.h"

@interface LogFileViewController ()

@property (strong) NSMutableArray *fetchResults;

@end

@implementation LogFileViewController

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
}

//***********************************************************************
// viewDidAppear to get data to display into table view
//***********************************************************************
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    // Fetch badges from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest3 = [[NSFetchRequest alloc] initWithEntityName:@"LogFile"];
    self.fetchResults = [[managedObjectContext executeFetchRequest:fetchRequest3 error:nil] mutableCopy];
    
    NSLog(@"Number of rows: %d", self.fetchResults.count);
    
    
    // Load table view
    [self.LogList reloadData];
    
    
    
}

//***********************************************************************
//  Populate Table
//***********************************************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"LogCell";
    LogFileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *row = [self.fetchResults objectAtIndex:indexPath.row];
    
    
    NSLog(@"Username: %@",[NSString stringWithFormat:@"%@", [row valueForKey:@"userid"]]);
    
    [cell.UserName setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"userid"]]];
    [cell.DateTime setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"timestamp"]]];
    [cell.Score setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"score"]]];
    [cell.Gametype setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"gametype"]]];
    [cell.Operator setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"operator"]]];
    [cell.Level setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"level"]]];
    
    //[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    //cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator.png"]];
    
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.fetchResults.count;
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
