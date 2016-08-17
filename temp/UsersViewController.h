//
//  UsersViewController.h
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/18/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersViewController : UIViewController
- (IBAction)Done:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *UserList;
@property (strong, nonatomic) NSManagedObject *SelectedRow;

@end
