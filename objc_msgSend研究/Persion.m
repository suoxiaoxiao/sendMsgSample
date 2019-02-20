//
//  Persion.m
//  objc_msgSend研究
//
//  Created by 索晓晓 on 2019/2/19.
//  Copyright © 2019 SXiao.RR. All rights reserved.
//

#import "Persion.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Persion

- (void)other{
    NSLog(@"%s",__func__);
}

//消息动态解析
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(test)) {

        Method method = class_getInstanceMethod(self, @selector(other));

        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));

        return YES;

    }
   return [super resolveInstanceMethod:sel];
}

//消息转发
//第一种1.0
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(test)) {
        //返回值为nil,相当于没有实现这个方法
        return [[Cat alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

//第二种2.0
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    //返回方法签名
    return [NSMethodSignature signatureWithObjCTypes:"v16@:"];
}
//NSInvocation 里面包含了: 方法调用者,方法名,参数
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //修改方法调用者
    anInvocation.target = [[Cat alloc] init];
    //调用方法
    [anInvocation invoke];
}

@end
