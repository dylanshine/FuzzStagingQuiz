//
//  FuzzDataManager.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "FuzzDataManager.h"
#import <AFNetworking.h>

@implementation FuzzDataManager

+(instancetype)sharedManager {
    static FuzzDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

-(void)fetchFuzzData:(NSString *)urlString completion:(void (^)())block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:urlString parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             block();
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

@end
