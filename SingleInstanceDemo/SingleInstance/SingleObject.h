//
//  SingleObject.h
//  SingleInstanceDemo
//
//  Created by zhangyafeng on 15/5/13.
//  Copyright (c) 2015年 think. All rights reserved.
//

#import <Foundation/Foundation.h>


/**在ARC状况下管理 单例的创建  
 考虑线程安全
 使用 @synchronized(self){}  关键字
 */
@interface SingleObject : NSObject
+(SingleObject*)shareInstance;
@end
