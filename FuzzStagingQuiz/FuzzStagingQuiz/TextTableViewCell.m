//
//  TextTableViewCell.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "TextTableViewCell.h"

@interface TextTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *fuzzTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation TextTableViewCell

-(void)setTextData:(FuzzTextData *)textData {
    _textData = textData;
    self.fuzzTextLabel.text = textData.text;
    self.dateLabel.text = textData.formattedDate;
}

@end
