//
//  UserViewController.h
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/28/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *FirstName;
@property (weak, nonatomic) IBOutlet UITextField *LastName;
@property (weak, nonatomic) IBOutlet UITextField *School;
- (IBAction)Save:(id)sender;
@property (strong, nonatomic) NSArray *SequeData;
//row to update
@property (strong, nonatomic) NSManagedObject *Seque_Row;

@end
