//
//  NetworkManager.m
//  TestProject
//
//  Created by yichengxu on 15/5/12.
//  Copyright (c) 2015年 Insigmaservice. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager


+ (void)loginIn
{
    NSString *baseUrl = @"http://test.kmfex.com/platform/";
  //  NSString *baseUrl = @"https://kmfex-qc.hengtiansoft.com/platform/";
   // NSString *baseUrl = @"https://www.weeex.com/platform";
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
  //  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // TODO:
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer.timeoutInterval = 30.;
//    
    [manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    [manager.requestSerializer setValue:@"FAKEFORM" forHTTPHeaderField:@"x-form-id"];
    [manager.requestSerializer setValue:@"json" forHTTPHeaderField:@"dataType"];
//    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", nil];

 //   manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *postUrlStr = @"app/user/login4";
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"psy003", @"userName",
                          @"123456", @"password",
//                          @"53010100170", @"userName",
//                          @"888888", @"password",
                          nil];
    
    [manager POST:postUrlStr
       parameters:dict
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              

           //   NSDictionary *responseDi = [operation.response allHeaderFields];

              NSLog(@"response Header is %@.\n", [operation.response allHeaderFields]);
              NSLog(@"responseDic is %@.\n", responseObject);
              
              
              
              
        
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
          {
              NSLog(@"error info is %@.", error);
              
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息"
                                                              message:error.localizedDescription
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
              
              [alert show];
              
          }];
    
    
}

@end
