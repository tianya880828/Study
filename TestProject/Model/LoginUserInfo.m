//
//  LoginUserInfo.m
//  TestProject
//
//  Created by qqcheng on 15/5/13.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "LoginUserInfo.h"

@implementation StatusInfo


@end

@implementation DataInfo


@end

@implementation LoginUserInfo

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"code": @"result",
                                                       @"data.statusForMobile.name":@"name",
                                                       }];
}

@end
