//
//  CalculatorBrain.h
//  RPNCalculator
//
//  Created by Mac KC on 12/7/12.
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
