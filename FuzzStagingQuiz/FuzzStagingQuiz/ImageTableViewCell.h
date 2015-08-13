//
//  ImageTableViewCell.h
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuzzImageData.h"

@interface ImageTableViewCell : UITableViewCell
@property (nonatomic, strong) FuzzImageData *imageData;
@end
