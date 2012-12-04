//
//  CalculatorViewController.m
//  RPNCalculator
//
//  Created by Mac KC on 12/4/12.
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController
@synthesize display = _display;

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    
    self.display.text = digit;
    NSLog(@"user touched %@", digit);
}
@end
