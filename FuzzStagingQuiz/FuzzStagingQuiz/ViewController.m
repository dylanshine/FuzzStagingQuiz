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
#import "ImageTableViewCell.h"
#import "TextTableViewCell.h"
#import "FuzzImageData.h"
#import "FuzzTextData.h"
#import "ImageViewController.h"

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
        [self reloadFuzzData];
    }];
}

-(void) setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 150.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Segmeneted Control

- (IBAction)segmentedControlTapped:(id)sender {
    [self reloadFuzzData];
}

-(void)reloadFuzzData {
    NSInteger selectedSegment = self.segmentedControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        self.displayedData = [self.fuzzDataManager allData];
    } else if (selectedSegment == 1) {
        self.displayedData = [self.fuzzDataManager imageData];
    } else {
        self.displayedData = [self.fuzzDataManager textData];
    }
    [self.tableView reloadData];
}

#pragma mark - Tableview Delegate & Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayedData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.displayedData[indexPath.row]isKindOfClass:[FuzzImageData class]]) {
        FuzzImageData *fuzzImage = self.displayedData[indexPath.row];
        ImageTableViewCell *cell = (ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        cell.imageData = fuzzImage;
        return cell;
    } else {
        FuzzTextData *fuzzText = self.displayedData[indexPath.row];
        TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
        cell.textData = fuzzText;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.displayedData[indexPath.row]isKindOfClass:[FuzzImageData class]]) {
        [self performSegueWithIdentifier:@"imageSegue" sender:self];
    }
}

#pragma mark - Prepare for seque

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imageSegue"]) {
        ImageViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FuzzImageData *fuzzImage = self.displayedData[indexPath.row];
        destination.imageData = fuzzImage;
    }
}

@end
