//
//  FuzzData.h
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuzzData : NSObject
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSDate *date;
-(instancetype)initWithDictionary:(NSDictionary *)responseDict;
@end
