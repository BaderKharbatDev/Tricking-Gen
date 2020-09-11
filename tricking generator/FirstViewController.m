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
@property (strong, nonatomic) IBOutlet UIView *warningWindow;
@property (strong, nonatomic) IBOutlet UISegmentedControl *comboMode;
@property NSMutableArray * moveArray;

//styling
@property (strong, nonatomic) IBOutlet UIView *dropdownView;
@property (strong, nonatomic) IBOutlet UIView *largerMenuView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate* delegateInstance = ( AppDelegate* )[UIApplication sharedApplication].delegate;
    _manager = [delegateInstance manager];
    _moveArray = [[NSMutableArray alloc] init];
    
    
    self.countStepper.maximumValue = 10;
    self.countStepper.minimumValue = 3;
    self.countStepper.value = 3;
    self.countValue.text = [NSString stringWithFormat: @"Number of Moves:  %.0f", self.countStepper.value];
    
    
    //setup dropdown shit
    [self openMenuView: false];
}

-(void) openMenuView: (BOOL *) isOpen {
//    if(isOpen) {
//        CGRect newFrame = CGRectMake( self.largerMenuView.frame.origin.x, self.largerMenuView.frame.origin.y, 350, 260);
//        [self.largerMenuView setFrame: newFrame];
//          [self.dropdownView setHidden:true];
//    } else {
        [self.dropdownView setHidden:true];
        [UIView animateWithDuration:0.5f animations:^{
            CGRect newFrame = CGRectMake( self.largerMenuView.frame.origin.x, self.largerMenuView.frame.origin.y, 350, 210);
//            [self.largerMenuView setFrame: newFrame];
//            [self.largerMenuView]
            [self.view layoutIfNeeded];
            [self.largerMenuView layoutIfNeeded];
        }];
//    }
    [self.view layoutIfNeeded];
}

- (IBAction)onStepperChange:(UIStepper *) sender {
    self.countValue.text = [NSString stringWithFormat: @"Number of Moves:  %.0f", self.countStepper.value];
}

- (IBAction)testButton:(UIButton *) sender {
    @try {
        if(self.comboMode.selectedSegmentIndex == 0) {
            _moveArray = [_manager generateCreative: self.countStepper.value];
        } else {
            _moveArray = [_manager generateStructured: self.countStepper.value];
        }
        [self.table reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } @catch (NSException *exception) {
        [self displayWarningWindow];
    }
}

- (IBAction)onSlideChange:(UISegmentedControl *)sender {
    
}


-(void) displayWarningWindow {
    //add window
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.5f;
    blurEffectView.frame = self.view.frame;
    [self.view addSubview:blurEffectView];
    [self.view addSubview: self.warningWindow];
    self.warningWindow.center = self.view.center;
}
- (IBAction)warningWindowDismissed:(UIButton *)sender {
    [self.warningWindow removeFromSuperview];
    [self.view.subviews[self.view.subviews.count - 1] removeFromSuperview];
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
