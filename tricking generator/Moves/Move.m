//
//  Move.m
//  kickboxing app
//
//  Created by Bader on 5/19/20.
//  Copyright © 2020 Nebo. All rights reserved.
//

#import "Move.h"

@implementation Move
//auto generated by compiler
-(id)init: (NSString *) name  {
    self = [super init];
    if(self) {
        NSMutableArray * moveDict = [Move propListGetMove: get : name];
        self.name = name;
        self.take_off_stance = [[moveDict valueForKey: @"take_off_stance"] intValue];
        self.landing_stance = [[moveDict valueForKey: @"landing_stance"] intValue];
        self.take_off_swing = [[moveDict valueForKey: @"requires_swing"] boolValue];
        self.landing_can_swing = [[moveDict valueForKey: @"can_swing_on_landing"] boolValue];
        self.isActive = [[moveDict valueForKey: @"isActive"] boolValue];
    }
    return self;
}

+(NSMutableArray *) propListGetMove: (Operation) operation : (NSString *) name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"movedata.plist"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(!([fileManager fileExistsAtPath: plistPath])) {
        NSString * bundlePath = [[NSBundle mainBundle] pathForResource:@"movedata" ofType:@"plist"];
        @try {
            [fileManager copyItemAtPath:bundlePath toPath:plistPath error: NULL];
        } @catch (NSException *exception) {
            NSLog(@"Shit Fucked Up");
        }
    }
    
    NSMutableArray * rv;
    NSMutableDictionary * pDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSMutableArray * allCats = [pDict allValues];
    NSMutableArray * allMoves = [[NSMutableArray alloc] init];
    for(int i = 0; i < allCats.count; i++) {
        NSMutableArray * currCat = (NSMutableArray *) allCats[i];
        NSMutableArray * m = [currCat valueForKey: name];
        if(m != NULL) {
            rv = m;
        }
    }
    
    if(rv == NULL) {
        NSLog(@"%@ DOES NOT EXIST", name);
    }
    
    switch(operation) {
        case get:
            break;
        case update:
//            [pDict setObject: [NSNumber numberWithBool: move.isActive] forKey: move.name];
            [rv setValue: [NSNumber numberWithBool: ![[rv valueForKey: @"isActive"] boolValue]] forKey: @"isActive"];
            break;
    }
    [pDict writeToFile:plistPath atomically:YES];
    
    return rv;
}

+(NSArray *) getMovesInCat: (NSString *) name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"movedata.plist"];
        NSFileManager * fileManager = [NSFileManager defaultManager];
        if(!([fileManager fileExistsAtPath: plistPath])) {
            NSString * bundlePath = [[NSBundle mainBundle] pathForResource:@"movedata" ofType:@"plist"];
            @try {
                [fileManager copyItemAtPath:bundlePath toPath:plistPath error: NULL];
            } @catch (NSException *exception) {
                NSLog(@"Shit Fucked Up");
            }
        }
        
        NSMutableArray * rv = [[NSMutableArray alloc] init];
        NSMutableDictionary * pDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        NSMutableDictionary * cat = (NSMutableDictionary *) [pDict valueForKey: name];
        for(int i = 0; i < cat.allKeys.count ; i++) {
            [rv addObject: [[Move alloc] init: cat.allKeys[i]] ];
        }
        
        return rv;
}

@end
