//
//  DLInvocation+FoundationMapping.h
//  TestObjectiveCRuntime
//
//  Created by David Livadaru on 4/13/17.
//  Copyright © 2017 David Livadaru. All rights reserved.
//

#import "DLInvocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLInvocation (FoundationMapping)

- (nullable NSInvocation *)convertToFoundationInvocation;

@end

NS_ASSUME_NONNULL_END
