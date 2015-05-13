//
//  SingleObject.m
//  SingleInstanceDemo
//
//  Created by zhangyafeng on 15/5/13.
//  Copyright (c) 2015年 think. All rights reserved.
//

#import "SingleObject.h"

@implementation SingleObject

+(SingleObject*)shareInstance
{
    static SingleObject *singleObject;
    @synchronized(self){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            singleObject = [[super allocWithZone:NULL] init];
        });
    }
    
    return singleObject;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        return [self shareInstance];
    }
    return nil;
}

-(id)copyWithZone:(NSZone*)zone
{
    return self;
}





@end

