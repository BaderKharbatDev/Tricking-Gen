//
//  FirstViewController.m
//  tricking generator
//
//  Created by Bader on 8/5/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate>
@property MoveManager * manager;
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UIStepper *countStepper;
@property (strong, nonatomic) IBOutlet UILabel *countValue;
@property NSMutableArray * moveArray;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate* delegateInstance = ( AppDelegate* )[UIApplication sharedApplication].delegate;
    _manager = [delegateInstance manager];
    _moveArray = [[NSMutableArray alloc] init];
    
    
    self.countStepper.maximumValue = 10;
    self.countStepper.minimumValue = 1;
    self.countStepper.value = 4;
    self.countValue.text = [NSString stringWithFormat: @"%.0f", self.countStepper.value];
    
}

- (IBAction)onStepperChange:(UIStepper *) sender {
    self.countValue.text = [NSString stringWithFormat: @"%.0f", self.countStepper.value];
}

- (IBAction)testButton:(UIButton *) sender {
    _moveArray = [_manager generate: self.countStepper.value];
//    [self.table reloadData];
    [self.table reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    Move * current = (Move*) [self.moveArray objectAtIndex: indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat: @"%ld. %@", (long)indexPath.row + 1, current.name];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moveArray.count;
}
@end
