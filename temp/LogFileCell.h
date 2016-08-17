//
//  LogFileCell.h
//  Speed Math
//
//  Created by Ollie, Neon Shoes on 7/30/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogFileCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *DateTime;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (weak, nonatomic) IBOutlet UILabel *Gametype;
@property (weak, nonatomic) IBOutlet UILabel *Operator;
@property (weak, nonatomic) IBOutlet UILabel *Level;

@end
