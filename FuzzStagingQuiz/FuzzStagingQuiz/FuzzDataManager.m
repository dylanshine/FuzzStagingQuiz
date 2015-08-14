//
//  FuzzDataManager.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "FuzzDataManager.h"
#import <AFNetworking.h>
#import "FuzzImageData.h"
#import "FuzzTextData.h"

@interface FuzzDataManager ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation FuzzDataManager

+(instancetype)sharedManager {
    static FuzzDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

-(instancetype)init {
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)fetchFuzzData:(NSString *)urlString completion:(void (^)())block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:urlString parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [self createFuzzDataObjects:responseObject];
             block();
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

-(void)createFuzzDataObjects:(NSArray *)responseData {
    for (NSDictionary *dataDict in responseData) {
        if ([self dataCheck:dataDict]) {
            if ([dataDict[@"type"] isEqualToString:@"image"]) {
                FuzzImageData *fuzzImage = [[FuzzImageData alloc] initWithDictionary:dataDict];
                if (fuzzImage.imageURL) {
                    [self.data addObject:fuzzImage];
                }
            } else {
                FuzzTextData *fuzzText = [[FuzzTextData alloc] initWithDictionary:dataDict];
                [self.data addObject:fuzzText];
            }
        }
    }
}

-(BOOL)dataCheck:(NSDictionary *)dataDict {
    if (!dataDict[@"data"] || [dataDict[@"data"] length] == 0 || [dataDict[@"data"] isEqualToString:@"Nothing"]) {
        return NO;
    }
    return YES;
}

#pragma mark - Data Filtering

-(NSArray *)imageData {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"self isKindOfClass: %@",
                              [FuzzImageData class]];
    
    return [self.data filteredArrayUsingPredicate:predicate];
}

-(NSArray *)textData {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"self isKindOfClass: %@",
                              [FuzzTextData class]];
    
    return [self.data filteredArrayUsingPredicate:predicate];
}

-(NSArray *)allData {
    return [self.data copy];
}

@end
