//
//  HomeViewController.m
//  tricking generator
//
//  Created by Bader on 9/11/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"

@interface HomeViewController ()



//navigation buttons
@property (strong, nonatomic) IBOutlet UIButton *creativeButton;
@property (strong, nonatomic) IBOutlet UIButton *structuredButton;
@property (strong, nonatomic) IBOutlet UIButton *singleButton;
@property (strong, nonatomic) IBOutlet UIButton *filterButton;

@end

@implementation HomeViewController

- (IBAction)onMenuItemPress:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc;
    if(sender == self.creativeButton) {
//        vc = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"creative"];
        [self.tabBarController setSelectedIndex: 1];
    } else if (sender == self.structuredButton) {
//        vc = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"structured"];
        [self.tabBarController setSelectedIndex: 2];
    } else if (sender == self.singleButton) {
//        vc = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"single"];
        [self.tabBarController setSelectedIndex: 3];
    } else {
//        vc = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"filter"];
        [self.tabBarController setSelectedIndex: 4];
    }
    [self.navigationController pushViewController: vc animated: TRUE];
}


@end
