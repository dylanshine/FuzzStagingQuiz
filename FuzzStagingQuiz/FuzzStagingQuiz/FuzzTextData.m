//
//  FuzzTextData.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "FuzzTextData.h"

@implementation FuzzTextData

-(instancetype)initWithDictionary:(NSDictionary *)responseDict {
    if (self = [super initWithDictionary:responseDict]) {
        _text = responseDict[@"data"];
    }
    return self;
}

@end
