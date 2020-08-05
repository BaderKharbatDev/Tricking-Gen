//
//  AppDelegate.h
//  tricking generator
//
//  Created by Bader on 8/5/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

