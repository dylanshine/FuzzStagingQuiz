//
//  FuzzData.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "FuzzData.h"

@implementation FuzzData

-(instancetype)initWithDictionary:(NSDictionary *)responseDict {
    if (self = [super init]) {
        _identifier = responseDict[@"id"];
        _date = [self convertFuzzDate:responseDict[@"date"]];
        _formattedDate = [self checkDate:responseDict[@"date"]];
    }
    return self;
}

-(NSDate *)convertFuzzDate:(NSString *)responseDateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [dateFormatter dateFromString:responseDateString];
    return date;
}

-(NSString *)checkDate:(NSString *)dateString {
    if ([dateString length] == 0) {
        return @"Not Available";
    }
    return dateString;
}

@end
