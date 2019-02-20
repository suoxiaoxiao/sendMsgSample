//
//  main.m
//  objc_msgSend研究
//
//  Created by 索晓晓 on 2019/2/19.
//  Copyright © 2019 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persion.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Persion *persion = [[Persion alloc] init];
//      Persion *persion = objc_msgSend(objc_msgSend(objc_getClass("Persion"), sel_registerName("alloc")), sel_registerName("init"));
        
        [persion test];
//      objc_msgSend)(persion, sel_registerName("teset"));
       
    }
    return 0;
}

/*
 
 Persion *persion = ((Persion *(*)(id, SEL))(void *)objc_msgSend)((id)((Persion *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Persion"), sel_registerName("alloc")), sel_registerName("init"));
 
 ((void (*)(id, SEL))(void *)objc_msgSend)((id)persion, sel_registerName("teset"));

 */

