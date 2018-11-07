//
//  NSObject+PropertyTree.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PropertyTree)
+(NSString *)propertyTreeDescription:(NSString*)classString;
-(NSString *)propertyTreeDescriptionWithIndent:(NSUInteger)level;
@end
