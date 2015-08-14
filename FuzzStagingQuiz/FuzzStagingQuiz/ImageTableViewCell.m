//
//  ImageTableViewCell.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "ImageTableViewCell.h"
#import <UIKit+AFNetworking.h>

@interface ImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *fuzzImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation ImageTableViewCell

-(void)prepareForReuse {
    [super prepareForReuse];
    [self.fuzzImageView cancelImageRequestOperation];
    self.fuzzImageView.image = nil;
}

-(void) setImageData:(FuzzImageData *)imageData {
    _imageData = imageData;
    NSURLRequest *request = [NSURLRequest requestWithURL:imageData.imageURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:6];
    [self.fuzzImageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.fuzzImageView.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        UIImage *unavailableImage = [UIImage imageNamed:@"unavailable"];
        self.fuzzImageView.image = unavailableImage;
    }];
    self.dateLabel.text = imageData.formattedDate;
}

@end
