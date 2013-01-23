//
//  JavaScriptCoreRuntime.m
//  JavaScriptCoreRuntime
//
//  Created by Chong Francis on 13年1月23日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "JavaScriptCoreRuntime.h"

SpecBegin(JavaScriptCoreRuntime)

describe(@"-eval:", ^{
    __block JavaScriptCoreRuntime* runtime;
    
    beforeEach(^{
        runtime = [[JavaScriptCoreRuntime alloc] init];
    });
    
    it(@"should eval values", ^{
        expect([runtime eval:@"1"]).to.equal(1);
        expect([runtime eval:@"\"Hello\""]).to.equal(@"Hello");
        expect([runtime eval:@"a = [1, 2, 3]"]).to.equal((@[@1, @2, @3]));
        expect([runtime eval:@"a = {a: 'hello'}"]).to.equal((@{@"a": @"hello"}));
    });
    
    it(@"should eval function and run it", ^{
        [runtime eval:@"function add(a, b) {return a + b;}"];
        expect([runtime eval:@"add(10, 2)"]).to.equal(@12);
    });
});

SpecEnd