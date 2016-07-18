//
//  DLSelectorPerformer.m
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

#import "DLSelectorPerformer.h"

@implementation DLSelectorPerformer

+ (id)performSelector:(NSString *)selectorName forClass:(NSString *)className {
    NSInvocation *invocation = [DLSelectorPerformer invokeFromSelector:selectorName forClass:className];
    
    [invocation invoke];
    __unsafe_unretained id returnedValue;
    [invocation getReturnValue:&returnedValue];
    id valueToReturn = returnedValue;
    return valueToReturn;
}

+ (void)performNonReturnSelector:(NSString *)selectorName forClass:(NSString *)className {
    NSInvocation *invocation = [DLSelectorPerformer invokeFromSelector:selectorName forClass:className];
    [invocation invoke];
}

+ (NSInvocation *)invokeFromSelector:(NSString *)selectorName forClass:(NSString *)className {
    SEL selector = NSSelectorFromString(selectorName);
    Class class = NSClassFromString(className);
    NSAssert(class != nil, @"Failed to convert '%@' into a Class object", className);
    NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
    NSAssert(methodSignature != nil, @"Failed to create method signature for class '%@'", className);
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setSelector:selector];
    [invocation setTarget:class];
    
    return invocation;
}

@end
