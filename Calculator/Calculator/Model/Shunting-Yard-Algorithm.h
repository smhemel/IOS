//
//  Shunting-Yard-Algorithm.h
//  Calculator
//
//  Created by S M HEMEL on 24/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Shunting_Yard_Algorithm : NSObject
@property char *expression;
@property NSMutableString *str_equation;
-(NSString *) getAns:(int)size;
 
@end

NS_ASSUME_NONNULL_END
