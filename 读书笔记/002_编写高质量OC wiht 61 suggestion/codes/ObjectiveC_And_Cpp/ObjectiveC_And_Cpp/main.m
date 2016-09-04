//
//  main.m
//  ObjectiveC_And_Cpp
//
//  Created by zhangxiangxiong125960373 on 16/9/4.
//  Copyright © 2016年 com.ssm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableSet* set = [NSMutableSet set];
        
        Person* p1 = [[Person alloc] init];
        p1.name = @"Tony";
        [set addObject:p1];
       
        Person* p2 = [[Person alloc] init];
        p2.name = @"Tony";
        [set addObject:p2];
       
        NSLog(@"Set:%@", set);
    }
    return 0;
}
