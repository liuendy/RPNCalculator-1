//
//  CalculatorViewController.h
//  RPNCalculator
//
//  Created by Mac KC on 12/4/12.
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(id)sender;

@end
