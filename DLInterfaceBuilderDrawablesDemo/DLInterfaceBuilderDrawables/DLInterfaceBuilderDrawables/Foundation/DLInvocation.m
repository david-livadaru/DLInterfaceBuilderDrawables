//
//  DLInvocation.m
//  TestObjectiveCRuntime
//
//  Created by David Livadaru on 4/13/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

#import "DLInvocation.h"
#import "DLInvocation+FoundationMapping.h"

@interface DLInvocation ()

@property (nonatomic) Class class;
@property (nonatomic) SEL selector;

@end

@implementation DLInvocation

- (instancetype)initWithClass:(Class)class selector:(SEL)selector {
    self = [super init];
    
    if (self) {
        self.class = class;
        self.selector = selector;
    }
    
    return self;
}

+ (nullable instancetype)invocationWithClass:(Class)class selectorName:(NSString *)selectorName {
    SEL selector = [DLInvocation selectorFromName:selectorName];
    
    if (selector == nil) {
        return nil;
    }
    
    return [[DLInvocation alloc] initWithClass:class selector:selector];
}

+ (nullable instancetype)invocationWithClassName:(NSString *)className selector:(SEL)selector {
    Class class = [DLInvocation classFromName:className];
    
    if (class == nil) {
        return nil;
    }
    
    return [[DLInvocation alloc] initWithClass:class selector:selector];
}

+ (nullable instancetype)invocationWithClassName:(NSString *)className selectorName:(NSString *)selectorName {
    Class class = [DLInvocation classFromName:className];
    SEL selector = [DLInvocation selectorFromName:selectorName];
    
    if (class == nil || selector == nil) {
        return nil;
    }
    
    return [[DLInvocation alloc] initWithClass:class selector:selector];
}

+ (nullable Class)classFromName:(NSString *)className {
    Class class = NSClassFromString(className);
    
    if (class == nil) {
        NSLog(@"Failed to convert '%@' into a Class object.", className);
        return nil;
    }
    
    return class;
}

+ (nullable SEL)selectorFromName:(NSString *)selectorName {
    SEL selector = NSSelectorFromString(selectorName);
    
    if (selector == nil) {
        NSLog(@"Failed to convert '%@' into SEL.", selectorName);
    }
    
    return selector;
}

- (void)invoke {
    NSInvocation *invocation = [self convertToFoundationInvocation];
    [invocation invoke];
}

- (nullable id)valueFromInvocation {
    NSInvocation *invocation = [self convertToFoundationInvocation];
    
    [invocation invoke];
    __unsafe_unretained id returnedValue;
    [invocation getReturnValue:&returnedValue];
    id valueToReturn = returnedValue;
    return valueToReturn;
}

@end
