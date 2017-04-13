//
//  DLSelectorPerformer.h
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLSelectorPerformer: NSObject

+ (id)performSelector:(NSString *)selectorName forClass:(NSString *)className;
+ (void)performNonReturnSelector:(NSString *)selectorName forClass:(NSString *)className;

@end
