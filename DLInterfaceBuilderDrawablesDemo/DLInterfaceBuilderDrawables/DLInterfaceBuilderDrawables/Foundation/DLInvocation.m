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

@property (nonatomic, nullable) id target;
@property (nonatomic) Class class;
@property (nonatomic) SEL selector;

@end

@implementation DLInvocation

- (instancetype)initWithTarget:(nullable id)target class:(Class)class selector:(SEL)selector {
    self = [super init];
    
    if (self) {
        self.target = target;
        self.class = class;
        self.selector = selector;
    }
    
    return self;
}

+ (instancetype)invocationWithTarget:(id)target selector:(SEL)selector {
    return [[DLInvocation alloc] initWithTarget:target class:[target class] selector:selector];
}

+ (instancetype)invocationWithClass:(Class)class selector:(SEL)selector {
    return [[DLInvocation alloc] initWithTarget:nil class:class selector:selector];
}

+ (nullable instancetype)invocationWithTarget:(id)target selectorName:(NSString *)selectorName {
    SEL selector = [DLInvocation selectorFromName:selectorName];
    
    if (selector == nil) {
        return nil;
    }
    
    return [DLInvocation invocationWithTarget:target selector:selector];
}

+ (nullable instancetype)invocationWithClass:(Class)class selectorName:(NSString *)selectorName {
    SEL selector = [DLInvocation selectorFromName:selectorName];
    
    if (selector == nil) {
        return nil;
    }
    
    return [DLInvocation invocationWithClass:class selector:selector];
}

+ (nullable instancetype)invocationWithClassName:(NSString *)className selector:(SEL)selector {
    Class class = [DLInvocation classFromName:className];
    
    if (class == nil) {
        return nil;
    }
    
    return [DLInvocation invocationWithClass:class selector:selector];
}

+ (nullable instancetype)invocationWithClassName:(NSString *)className selectorName:(NSString *)selectorName {
    Class class = [DLInvocation classFromName:className];
    SEL selector = [DLInvocation selectorFromName:selectorName];
    
    if (class == nil || selector == nil) {
        return nil;
    }
    
    return [DLInvocation invocationWithClass:class selector:selector];
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
