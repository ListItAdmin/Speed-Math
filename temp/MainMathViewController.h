//
//  MainMathViewController.h
//  Hello World
//
//  Created by Ollie, Neon Shoes on 6/20/14.
//  Copyright (c) 2014 Pear. All rights reserved.
//

#import <UIKit/UIKit.h>
//extern NSInteger probcount;

@interface MainMathViewController : UIViewController

- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;
- (IBAction)button7:(id)sender;
- (IBAction)button8:(id)sender;
- (IBAction)button9:(id)sender;
- (IBAction)button0:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *Operator;
@property (weak, nonatomic) IBOutlet UILabel *Answer;
- (IBAction)AnswerButton:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)MathType:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *MathType;
- (IBAction)Start:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Start;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Difficulty;
@property (weak, nonatomic) IBOutlet UISegmentedControl *Type;
@property (weak, nonatomic) IBOutlet UIProgressView *Progress;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *Clear;
@property (weak, nonatomic) IBOutlet UIButton *AnswerButton;
- (IBAction)MaxProbs:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *MaxProbs;
@property (weak, nonatomic) IBOutlet UILabel *Timer;
@property (weak, nonatomic) IBOutlet UILabel *TimerSec;
@property (weak, nonatomic) IBOutlet UILabel *TimerMin;
@property (weak, nonatomic) IBOutlet UILabel *ProbNum;
- (IBAction)Stop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Stop_Reset;
- (IBAction)Difficulty:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reset;
- (IBAction)reset:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *username;


@end
