//
//  LoginUserInfo.h
//  TestProject
//
//  Created by qqcheng on 15/5/13.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "NSString+Common.h"
#import "JSONModel.h"


@interface StatusInfo : JSONModel

@property (nonatomic, assign) unsigned long code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *text;

@end

@interface DataInfo : JSONModel

@property (nonatomic, assign) BOOL isAudit;
@property (nonatomic, assign) BOOL isFinacier;
@property (nonatomic, assign) BOOL isInvestor;

@property (nonatomic, strong) StatusInfo<ConvertOnDemand> *statusForMobile;

@end

@interface LoginUserInfo : JSONModel

@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *nonBizError;

@property (nonatomic, strong) DataInfo *data;

@property (nonatomic, strong) NSString *name;

@end
