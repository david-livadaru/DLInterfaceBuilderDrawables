//
//  DLInvocation+FoundationMapping.m
//  TestObjectiveCRuntime
//
//  Created by David Livadaru on 4/13/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

#import "DLInvocation+FoundationMapping.h"

NS_ASSUME_NONNULL_BEGIN

@implementation DLInvocation (FoundationMapping)

- (nullable NSInvocation *)convertToFoundationInvocation {
    NSMethodSignature *methodSignature = [self.class methodSignatureForSelector:self.selector];
    
    if (methodSignature == nil) {
        NSLog(@"Failed to create method signature for class '%@' using selector '%@'.",
              NSStringFromClass(self.class), NSStringFromSelector(self.selector));
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setSelector:self.selector];
    [invocation setTarget:self.class];
    
    return invocation;
}

@end

NS_ASSUME_NONNULL_END
