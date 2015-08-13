//
//  FuzzImageData.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "FuzzImageData.h"

@implementation FuzzImageData

-(instancetype)initWithDictionary:(NSDictionary *)responseDict {
    if (self = [super initWithDictionary:responseDict]) {
        _imageURL = [NSURL URLWithString:responseDict[@"data"]];
    }
    return self;
}

@end
