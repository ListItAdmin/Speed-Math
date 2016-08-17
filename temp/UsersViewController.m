//
//  UsersViewController.m
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/18/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import "UsersViewController.h"
#import "UserTableViewCell.h"
#import "UserViewController.h"

@interface UsersViewController ()

@property (strong) NSMutableArray *fetchResults;

@end

@implementation UsersViewController

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

// ***********************************
// Setup EDIT Button
// ***********************************
- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    
    [super setEditing:editing animated:animated];
    
    [self.UserList setEditing:editing animated:animated];
    
    
}

//***********************************************************************
//  Delete a row
//***********************************************************************
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.fetchResults objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [self.fetchResults removeObjectAtIndex:indexPath.row];
        [self.UserList deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
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
    
    //allow row to be selected while in EDIT MODE
    self.UserList.allowsSelectionDuringEditing = YES;
    
    //self.editButton = self.editButtonItem;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

//***********************************************************************
// viewDidAppear to get data to display into table view
//***********************************************************************
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    // Fetch badges from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest3 = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.fetchResults = [[managedObjectContext executeFetchRequest:fetchRequest3 error:nil] mutableCopy];
    
    NSLog(@"Number of rows: %d", self.fetchResults.count);
    
    
    // Load table view
    [self.UserList reloadData];
    
    
    
}

//***********************************************************************
//  Populate Table
//***********************************************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"usercell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *row = [self.fetchResults objectAtIndex:indexPath.row];
    
    
    NSLog(@"Username: %@",[NSString stringWithFormat:@"%@", [row valueForKey:@"username"]]);
    
    [cell.UserName setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"username"]]];
    [cell.school setText:[NSString stringWithFormat:@"%@", [row valueForKey:@"school"]]];
    
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

//**********************
// SELECT ROW AT INDEX
//**********************
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSManagedObject *selectedUser = [self.fetchResults objectAtIndex:indexPath.row];
    if (self.UserList.isEditing) {
        
        // save selected row for seque to edit the row later
        _SelectedRow = selectedUser;
        
        UITableViewCell *cell = [self.UserList cellForRowAtIndexPath:indexPath];
        [self performSegueWithIdentifier:@"ShowUserDetails" sender:cell];
        
    }
    
    
    // Set the User selected to the CURRENT user
    [[NSUserDefaults standardUserDefaults] setObject:[selectedUser valueForKey:@"username"] forKey:@"currentUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSLog(@"Selected User: %@", [selectedUser valueForKey:@"username"]);
    
     
    
}

// ***********************************
// Seque to UPDATE View Controller
// ***********************************

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"ShowUserDetails"]) {
        
        UserViewController  *editusercontroller = [segue destinationViewController];
        
        editusercontroller.SequeData = @[@"Update"];
        
        editusercontroller.Seque_Row = _SelectedRow;
        
        
        NSLog(@"Selected Row: %@", [_SelectedRow valueForKey:@"username"] );
        
        
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

- (IBAction)Done:(id)sender {
    //show view
    [self.presentingViewController viewDidAppear:YES];
    //close view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
