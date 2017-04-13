//
//  DLInvocation.h
//  TestObjectiveCRuntime
//
//  Created by David Livadaru on 4/13/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLInvocation : NSObject

@property (nonatomic, readonly) Class class;
@property (nonatomic, readonly) SEL selector;

- (instancetype)initWithClass:(Class)class selector:(SEL)selector;

+ (nullable instancetype)invocationWithClass:(Class)class selectorName:(NSString *)selectorName;
+ (nullable instancetype)invocationWithClassName:(NSString *)className selector:(SEL)selector;
+ (nullable instancetype)invocationWithClassName:(NSString *)className selectorName:(NSString *)selectorName;

- (void)invoke;
- (nullable id)valueFromInvocation;

@end

NS_ASSUME_NONNULL_END
