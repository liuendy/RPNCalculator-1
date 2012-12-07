//
//  CalculatorViewController.m
//  RPNCalculator
//
//  Created by Mac KC on 12/4/12.
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController() 
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringNumber = _userIsInTheMiddleOfEnteringNumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain {
    
    if(!_brain) _brain = [[CalculatorBrain alloc] init]; // Lazy Instantiation
    return  _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    
    if (self.userIsInTheMiddleOfEnteringNumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringNumber = YES;
    }
    
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringNumber = NO;
}

- (IBAction)operationPressed:(id)sender {
    // For example, 6 Enter 4 - would be the same as 6 Enter 4 Enter -.
    if (self.userIsInTheMiddleOfEnteringNumber) {
        [self enterPressed];
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

@end
