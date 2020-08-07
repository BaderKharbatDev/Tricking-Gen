//
//  FirstViewController.m
//  tricking generator
//
//  Created by Bader on 8/5/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property MoveManager * manager;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate* delegateInstance = ( AppDelegate* )[UIApplication sharedApplication].delegate;
    _manager = [delegateInstance manager];
}


- (IBAction)testButton:(UIButton *)sender {
    [_manager generate: 1];
}


@end
