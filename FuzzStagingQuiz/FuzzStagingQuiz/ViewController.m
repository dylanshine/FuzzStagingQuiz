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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FuzzDataManager *fuzzDataManager;
@property (nonatomic, strong) NSArray *displayedData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFuzzDataManager];
    [self setupTableView];
   
}

#pragma mark - Setup View Controller

-(void) setupFuzzDataManager {
    self.fuzzDataManager = [FuzzDataManager sharedManager];
    [self.fuzzDataManager fetchFuzzData:kFUZZ_API completion:^{
    
    }];
}

-(void) setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Segmeneted Control

- (IBAction)segmentedControlTapped:(id)sender {
    
}

#pragma mark - Tableview Delegate & Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayedData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

@end
