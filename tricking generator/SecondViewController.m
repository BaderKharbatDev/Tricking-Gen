//
//  SecondViewController.m
//  tricking generator
//
//  Created by Bader on 8/5/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import "SecondViewController.h"
#import "MoveManager.h"
#import "AppDelegate.h"
#import "CellMenuItem.h"
#import "HeaderCell.h"
#import "MoveCell.h"

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate>
@property MoveManager * manager;
@property (strong, nonatomic) IBOutlet UITableView *table;
@property NSMutableArray * editHeaderArray;
@property NSMutableArray * editActualArray;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate* delegateInstance = ( AppDelegate* )[UIApplication sharedApplication].delegate;
    _manager = [delegateInstance manager];
    
    [self setupEditTable];
}


//---------------MODAL POP UP METHODS------------------------------------------

//-(void) displayWarningWindow {
//    //add window
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView * blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    blurEffectView.alpha = 0.5f;
//    blurEffectView.frame = self.view.frame;
//    [self.view addSubview:blurEffectView];
//    [self.view addSubview: self.warningWindow];
//    self.warningWindow.center = self.view.center;
//}
//- (IBAction)warningWindowDismissed:(UIButton *)sender {
//    [self.warningWindow removeFromSuperview];
//    [self.view.subviews[self.view.subviews.count - 1] removeFromSuperview];
//}

- (IBAction)didDropDownPressed:(UIButton *)sender forEvent:(UIEvent *)event{
    int index = 0;
    for(int i = 0; i < self.editActualArray.count; i++) {
        if([(CellMenuItem *) self.editActualArray[i] isHeader] && [(HeaderCell *)[(CellMenuItem *) self.editActualArray[i] cell] arrowButton] == sender) {
            index = i;
            break;
        }
    }
    HeaderCell * selCell = (HeaderCell *)[(CellMenuItem *) self.editActualArray[index] cell];
    if([selCell isOpen]) {
        [self.editActualArray removeObjectsInRange: NSMakeRange(index+1, selCell.moveCellArray.count)];
    } else {
        for(int i = 0; i < [selCell moveCellArray].count; i++){
            [self.editActualArray insertObject: [selCell moveCellArray][i] atIndex: index+1+i];
        }
    }
    selCell.isOpen = !selCell.isOpen;
    if(selCell.isOpen)
        [sender setImage:[UIImage imageNamed:@"arrowdown"] forState:UIControlStateNormal];
    else
        [sender setImage:[UIImage imageNamed:@"arrowright"] forState:UIControlStateNormal];
    [self.table reloadData];
}

//Called whenever a move is enabled or disabled
//ensures each header cell updates its texty
- (IBAction)updateActiveStatusText:(UIButton *)sender {
    for( CellMenuItem * item in self.editHeaderArray) {
        [(HeaderCell *)[item cell] updateActiveNumber];
    }
}

- (IBAction)headerCheckBoxAction:(UIButton *)sender {
    int index = 0;
    for(int i = 0; i < self.editHeaderArray.count; i++) {
        if([(HeaderCell *)[(CellMenuItem *) self.editHeaderArray[i] cell] checkBoxImg] == sender) {
            index = i;
            break;
        }
    }
    HeaderCell * selCell = (HeaderCell *)[(CellMenuItem *) self.editHeaderArray[index] cell];
    [selCell checkBoxPressedAction];
}

-(void) setupEditTable {
    [self.table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.table.allowsSelection = false;
    
    _editHeaderArray = [[NSMutableArray alloc] init];
//    CellMenuItem * normal_kicks_Header;
//    CellMenuItem * pop_kicks_Header;
//    CellMenuItem * cheat_kicks_Header;
//    CellMenuItem * swing_kicks_Header;
//    CellMenuItem * flat_spin_Header;
//    CellMenuItem * flat_twist_Header;
//    CellMenuItem * backwards_flips_Header;
//    CellMenuItem * backwards_twists_Header;
//    CellMenuItem * forward_flips_Header;
//    CellMenuItem * forward_twists_Header;
//    CellMenuItem * outside_flips_Header;
//    CellMenuItem * outside_twists_Header;
//    CellMenuItem * inside_tricks;
//    self.editHeaderArray = @[normal_kicks_Header, pop_kicks_Header, cheat_kicks_Header, swing_kicks_Header, flat_spin_Header, flat_twist_Header, backwards_flips_Header, backwards_twists_Header, forward_flips_Header, forward_twists_Header, outside_flips_Header, outside_twists_Header, inside_tricks];
    
    NSArray * headerNames = @[@"Basic Kicks",@"Pop Kicks",@"Cheat Kicks",@"Swing Kicks",@"Flat Tricks",@"Flat Twists",@"Backwards Flips",@"Backwards Twists",@"Forward Flips", @"Forward Twists", @"Outside Flips",@" Outside Twists",@"Inside Tricks"];
    
    for(int i = 0; i < _manager.moveCatList.count; i++) {
        NSMutableArray * moveCellList = [[NSMutableArray alloc] init];
        NSMutableArray * currMoveCat = _manager.moveCatList[i];
        for(int z = 0; z < currMoveCat.count; z++) {
            CellMenuItem * m = [[CellMenuItem alloc] init: false : [[MoveCell alloc] initWithCell:currMoveCat[z] : [self.table dequeueReusableCellWithIdentifier:@"editsub"]]];
            [moveCellList addObject:m];
        }
        CellMenuItem * menuItem = [[CellMenuItem alloc] init:true :[[HeaderCell alloc] initWithCell: headerNames[i] :[self.table dequeueReusableCellWithIdentifier:@"edit"] : moveCellList]];
        
        [self.editHeaderArray addObject: menuItem];
    }
    
    //init menu containing the edit window cellmenuitems
    self.editActualArray = [[NSMutableArray alloc] init];
    for(CellMenuItem * item in self.editHeaderArray) {
        [self.editActualArray addObject: (CellMenuItem *) item];
    }
}


//------------------------------table-------------------------------------------------------------------------------------------
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
        if([(CellMenuItem *) [self.editActualArray objectAtIndex:indexPath.row] isHeader]) {
            HeaderCell * cell = (HeaderCell *) [(CellMenuItem *)[self.editActualArray objectAtIndex:indexPath.row] cell];
            return cell;
        } else {
            MoveCell * cell = (MoveCell *) [(CellMenuItem *)[self.editActualArray objectAtIndex:indexPath.row] cell];
            return cell;
        }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return _editActualArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
