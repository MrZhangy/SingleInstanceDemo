#OBJC单例的实现


###实现单例需要面对一下两个障碍：
1、发起调用的对象不能以其他分配方式实例化单例对象（alloc, copy）
2、对单例对象实例化的限制因该与引用计数内存模式共存。


注意：该实现是在ARC下实现的    如果内存是在手动释放需要添加  retain,release, autorelease
<pre><code>
-(id)retain
{
	return self;
}

-(NSUInteger) retainCount
{
	return NSUIntegerMax;
}

-(void)release
{
	//什么也不做
}

-(id) autorelease
{
	return self;
}

</code></pre>



单例实现：
<pre><code>
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

</code></pre>
