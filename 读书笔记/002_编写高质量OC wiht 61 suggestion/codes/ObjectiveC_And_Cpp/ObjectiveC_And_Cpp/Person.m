//
//  Person.m
//  ObjectiveC_And_Cpp
//
//  Created by zhangxiangxiong125960373 on 16/9/4.
//  Copyright © 2016年 com.ssm. All rights reserved.
//

#import "Person.h"




@implementation Person



-(BOOL)isEqual:(id)object
{
    
    if( [object isKindOfClass:[self class]])
    {
        Person* tmp = (Person*)object;
        return [self.name isEqualToString:tmp.name];
    }
    else
    {
        return NO;
    }
}


-(NSUInteger)hash
{
    return [self.name hash];
}


-(NSString *)description
{
    return  self.name;
}
@end
