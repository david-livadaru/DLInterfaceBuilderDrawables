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
    id target = self.target != nil ? self.target : self.class;
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:self.selector];
    
    if (methodSignature == nil) {
        NSLog(@"Failed to create method signature for class '%@'.", NSStringFromClass(self.class));
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.selector = self.selector;
    invocation.target = target;
    
    return invocation;
}

@end

NS_ASSUME_NONNULL_END
