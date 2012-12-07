//
//  CalculatorBrain.m
//  RPNCalculator
//
//  Created by Mac KC on 12/7/12.
//  Copyright (c) 2012 Apple Inc. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    // All @property start out nil (zero).
    // Send a message to nil does nothing because it is not initialized.
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    return _operandStack;
}

- (void)setOperandStack:(NSMutableArray *)operandStack {
    _operandStack = operandStack;
}

- (void)pushOperand:(double)operand {
    // self.operandStack is nil, send a message (addObject:) to nil does nothing.
    NSNumber *operationObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operationObject];
}

- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    // Send lastObject to an array that is empty just returns nil.
    // Send removeLastObject to an array will raise an exception (index out of bounds) and crash your program!
    // That is why we check to see if we actually got a non-nil operandObject from the array before trying to call removeLastObject.
    if (operandObject) [self.operandStack removeLastObject]; // removeLastObject on an empty array must crash!
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation {
    
    double result = 0;
    
    // Perform the operation here, store answer in result
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else  if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    }
    
    [self pushOperand:result];
    
    return result;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"stack = %@", self.operandStack];
}

@end
