//
//  ImageViewController.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "ImageViewController.h"
#import <UIKit+AFNetworking.h>

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDismissTapGesture];
    [self fetchFuzzImage];
}

-(void)setupDismissTapGesture {
    UITapGestureRecognizer *dismiss =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(dismissTap)];
    [self.view addGestureRecognizer:dismiss];
}

- (void)dismissTap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)fetchFuzzImage {
    [self.spinner startAnimating];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.imageData.imageURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [self.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [self.spinner stopAnimating];
        self.imageView.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [self.spinner stopAnimating];
        self.imageView.image = [UIImage imageNamed:@"unavailable"];
    }];
}

@end
