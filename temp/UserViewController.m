
//
//  UserViewController.m
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/28/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

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
    
    if ([_SequeData[0] isEqualToString:@"Update"]){
        
        NSLog(@"UPDATE");
        
        [self setTitle:@"Update User"];
        
        self.Username.text = [NSString stringWithFormat:@"%@", [_Seque_Row valueForKey:@"username"]];
        self.FirstName.text = [NSString stringWithFormat:@"%@", [_Seque_Row valueForKey:@"firstname"]];
        self.LastName.text = [NSString stringWithFormat:@"%@", [_Seque_Row valueForKey:@"lastname"]];
        self.School.text = [NSString stringWithFormat:@"%@", [_Seque_Row valueForKey:@"school"]];
        
    } else {
        
        [self setTitle:@"Add User"];
        
        
        //self.navigationController.navigationBar.topItem.title = @"Add Item";
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

- (IBAction)Save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if ([_SequeData[0] isEqualToString:@"Update"]){
        
        //update core data
        [_Seque_Row setValue:self.Username.text forKey:@"username"];
        [_Seque_Row setValue:self.FirstName.text forKey:@"firstname"];
        [_Seque_Row setValue:self.LastName.text forKey:@"lastname"];
        [_Seque_Row setValue:self.School.text forKey:@"school"];
        
    } else {
    // Create a new managed object
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    
    [newUser setValue:self.Username.text forKey:@"username"];
    [newUser setValue:self.FirstName.text forKey:@"firstname"];
    [newUser setValue:self.LastName.text forKey:@"lastname"];
    [newUser setValue:self.School.text forKey:@"school"];
    }
        
        
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
