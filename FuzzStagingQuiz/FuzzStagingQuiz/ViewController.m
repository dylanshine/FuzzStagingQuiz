//
//  ViewController.m
//  FuzzStagingQuiz
//
//  Created by Dylan Shine on 8/13/15.
//  Copyright (c) 2015 Dylan Shine. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "FuzzDataManager.h"

@interface ViewController ()
@property (nonatomic, strong) FuzzDataManager *fuzzDataManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFuzzDataManager];
   
}

#pragma mark - Setup View Controller

-(void) setupFuzzDataManager {
    self.fuzzDataManager = [FuzzDataManager sharedManager];
    [self.fuzzDataManager fetchFuzzData:kFUZZ_API completion:^{
    
    }];
}

@end
