//
//  FuzzDataManager.h
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuzzDataManager : NSObject
+(instancetype)sharedManager;
-(void)fetchFuzzData:(NSString *)urlString completion:(void (^)())block;
@end
