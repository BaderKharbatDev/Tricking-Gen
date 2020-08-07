//
//  Move.m
//  kickboxing app
//
//  Created by Bader on 5/chest_forward9/chest_back0.
//  Copyright © chest_back0chest_back0 Nebo. All rights reserved.
//

#import "MoveManager.h"

@implementation MoveManager : NSObject
//auto generated by compiler
-(id)init {
    self = [super init];
    if(self) {
        self.moveCatList = [[NSMutableDictionary alloc] init];
        NSMutableArray * normal_kicks = [[NSMutableArray alloc] init];
            {
                [normal_kicks addObject: [[Move alloc] init:@"Round" : chest_forward :  chest_back ]];
                [normal_kicks addObject: [[Move alloc] init:@"Hook" : chest_back : chest_forward ]];
                [normal_kicks addObject: [[Move alloc] init:@"Low Round" : chest_forward : chest_back ]];
                [normal_kicks addObject: [[Move alloc] init:@"Low Hook" : chest_back : chest_forward ]];
                [normal_kicks addObject: [[Move alloc] init:@"Touch Down Round" : chest_forward : chest_back ]];
            }
        NSMutableArray * pop_kicks = [[NSMutableArray alloc] init];
            {
                [pop_kicks addObject: [[Move alloc] init:@"Pop Tornado" : chest_back : chest_back ]];
                [pop_kicks addObject: [[Move alloc] init:@"Pop 360" : chest_back : chest_back ]];
                [pop_kicks addObject: [[Move alloc] init:@"Backside 900" : backwards : chest_back ]];
                [pop_kicks addObject: [[Move alloc] init:@"Pop 720 Hook" : chest_back : chest_forward ]];
            }
        NSMutableArray * cheat_kicks = [[NSMutableArray alloc] init];
            {
                [cheat_kicks addObject: [[Move alloc] init:@"Tornado" : chest_back : chest_back ]];
                [cheat_kicks addObject: [[Move alloc] init:@"Parafuso" : chest_back : chest_back ]];
                [cheat_kicks addObject: [[Move alloc] init:@"540" : chest_back : chest_forward ]];
                [cheat_kicks addObject: [[Move alloc] init:@"Cheat 720" : chest_back : chest_forward ]];
                [cheat_kicks addObject: [[Move alloc] init:@"Jack Knife" : chest_back : chest_forward ]];
                [cheat_kicks addObject: [[Move alloc] init:@"Cheat 900" : chest_back : chest_back ]];
                [cheat_kicks addObject: [[Move alloc] init:@"Hurricane" : chest_back : chest_forward ]];
            }
        NSMutableArray * swing_kicks = [[NSMutableArray alloc] init];
            {
                [swing_kicks addObject: [[Move alloc] init:@"Skip Hook" : chest_forward : chest_forward ]];
//                [swing_kicks addObject: [[Move alloc] init:@"Swing 900" : forwards : chest_back ]];
            }
        NSMutableArray * flat_spins = [[NSMutableArray alloc] init];
            {
                [flat_spins addObject: [[Move alloc] init:@"Butterfly Kick" : chest_forward : chest_forward ]];
                [flat_spins addObject: [[Move alloc] init:@"Butter Knife" : chest_forward : chest_forward ]];
                [flat_spins addObject: [[Move alloc] init:@"Machine" : chest_back : chest_forward ]];
                [flat_spins addObject: [[Move alloc] init:@"Spider" : chest_back : chest_forward ]];
            }
        NSMutableArray * flat_twists = [[NSMutableArray alloc] init];
            {
                [flat_twists addObject: [[Move alloc] init:@"Btwist" : chest_forward : backwards ]];
                [flat_twists addObject: [[Move alloc] init:@"Btwist Shuriken" : chest_forward : chest_back ]];
                [flat_twists addObject: [[Move alloc] init:@"Btwist Round" : chest_forward : chest_back ]];
                [flat_twists addObject: [[Move alloc] init:@"Btwist Hyper Hook" : chest_forward : chest_forward ]];
                [flat_twists addObject: [[Move alloc] init:@"Spyder Twist" : chest_back : chest_back ]];
                [flat_twists addObject: [[Move alloc] init:@"Double Btwist" : chest_forward : chest_back ]];
            }
        NSMutableArray * backward_flips = [[NSMutableArray alloc] init];
            {
                [backward_flips addObject: [[Move alloc] init:@"Back Hand Spring" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Back Tuck" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Flash Kick" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Rocket Boi" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Double Back" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Arabian" : backwards : forwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Gainer Tuck" : forwards : forwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Cheat Gainer" : backwards : chest_forward ]];
                [backward_flips addObject: [[Move alloc] init:@"Gainer Switch" : backwards : backwards ]];
                [backward_flips addObject: [[Move alloc] init:@"Moon Kick" : backwards : forwards ]];
            }
        NSMutableArray * backward_twists = [[NSMutableArray alloc] init];
            {
                [backward_twists addObject: [[Move alloc] init:@"Full" : backwards : backwards ]];
                [backward_twists addObject: [[Move alloc] init:@"Double Full" : backwards : backwards ]];
                [backward_twists addObject: [[Move alloc] init:@"Corkscrew" : backwards : backwards ]];
                [backward_twists addObject: [[Move alloc] init:@"Cork Round" : backwards : backwards ]];
                [backward_twists addObject: [[Move alloc] init:@"Boxcutter" : backwards : chest_forward ]];
            }
        NSMutableArray * forward_flips = [[NSMutableArray alloc] init];
            {
                [forward_flips addObject: [[Move alloc] init:@"Dive Roll" : forwards : forwards ]];
                [forward_flips addObject: [[Move alloc] init:@"Front Handspring" : forwards : forwards ]];
                [forward_flips addObject: [[Move alloc] init:@"Front Tuck" : forwards : forwards ]];
                [forward_flips addObject: [[Move alloc] init:@"Russian Front" : forwards : forwards ]];
                [forward_flips addObject: [[Move alloc] init:@"Front Half" : forwards : backwards ]];
                [forward_flips addObject: [[Move alloc] init:@"Webster" : forwards : forwards ]];
            }
        NSMutableArray * forward_twists = [[NSMutableArray alloc] init];
        {
            [forward_twists addObject: [[Move alloc] init:@"360 Dive Roll" : forwards : forwards ]];
        }
        NSMutableArray * outside_flips = [[NSMutableArray alloc] init];
        {
            [outside_flips addObject: [[Move alloc] init:@"Dleg" : chest_back : backwards ]];
            [outside_flips addObject: [[Move alloc] init:@"Gumbi" : chest_forward : backwards ]];
            [outside_flips addObject: [[Move alloc] init:@"Raiz" : chest_forward : backwards ]];
            [outside_flips addObject: [[Move alloc] init:@"TDR" : chest_forward : backwards ]];
            [outside_flips addObject: [[Move alloc] init:@"Sailor Moon" : chest_forward : backwards ]];
        }
        NSMutableArray * outside_twists = [[NSMutableArray alloc] init];
        {
            [outside_twists addObject: [[Move alloc] init:@"Snapu" : chest_forward : chest_back ]];
        }
        NSMutableArray * inside_tricks = [[NSMutableArray alloc] init];
        {
            [inside_tricks addObject: [[Move alloc] init:@"Sideflip" : chest_forward : chest_forward ]];
            [inside_tricks addObject: [[Move alloc] init:@"Cartwheel" : chest_forward : chest_forward ]];
            [inside_tricks addObject: [[Move alloc] init:@"Roundoff" : chest_forward : backwards ]];
            [inside_tricks addObject: [[Move alloc] init:@"Helicoptero" : chest_forward : forwards ]];
            [inside_tricks addObject: [[Move alloc] init:@"Aerial" : chest_forward : chest_forward ]];
            [inside_tricks addObject: [[Move alloc] init:@"Aerial Hook" : chest_forward : chest_forward ]];
            [inside_tricks addObject: [[Move alloc] init:@"Aerial Mega" : chest_forward : chest_forward ]];
            [inside_tricks addObject: [[Move alloc] init:@"Scoot" : chest_forward : backwards ]];
            [inside_tricks addObject: [[Move alloc] init:@"Master Scoot" : chest_forward : backwards ]];

        }

        [_moveCatList setObject: normal_kicks forKey:@"normal_kicks"];
        [_moveCatList setObject: pop_kicks forKey:@"pop_kicks"];
        [_moveCatList setObject: cheat_kicks forKey:@"cheat_kicks"];
        [_moveCatList setObject: swing_kicks forKey:@"swing_kicks"];
        [_moveCatList setObject: flat_spins forKey:@"flat_spins"];
        [_moveCatList setObject: flat_twists forKey:@"flat_twists"];
        [_moveCatList setObject: backward_flips forKey:@"backward_flips"];
        [_moveCatList setObject: backward_twists forKey:@"backward_twists"];
        [_moveCatList setObject: forward_flips forKey:@"forward_flips"];
        [_moveCatList setObject: forward_twists forKey:@"forward_twists"];
        [_moveCatList setObject: outside_flips forKey:@"outside_flips"];
        [_moveCatList setObject: outside_twists forKey:@"outside_twists"];
        [_moveCatList setObject: inside_tricks forKey:@"inside_tricks"];
        
        self.moveList = [[NSMutableArray alloc] init];
        for(int i = 0; i < self.moveCatList.count; i++) {
            for(int n = 0; n < [(NSMutableArray *) self.moveCatList.allValues[i] count]; n++) {
                [_moveList addObject: (Move *) [(NSMutableArray *) self.moveCatList.allValues[i] objectAtIndex:n] ];
            }
        }
    }
    return self;
}
-(NSMutableArray *)generate: (int) size {
    NSMutableArray * rv = [[NSMutableArray alloc] init];
    
    Move * current = [self randomMove: [self getActiveMoveList]];
    [rv addObject: current];
    
    for(int i = 0; i < size - 1; i++) {
        current = [self getNextMoveHelper: current];
        [rv addObject: current];
    }
    [self printMoveArray: rv];
    return rv;
}

-(Move *) getNextMoveHelper: (Move *) old {
    NSMutableArray * temp_move_list = [[NSMutableArray alloc] init];
    NSMutableArray * activeMoveList = [self getActiveMoveList];
    Move * current;
    for(int i = 0; i < activeMoveList.count; i++) {
        current = activeMoveList[i];
        if(old.landing_stance == current.take_off_stance) {
            [temp_move_list addObject: current];
        }
    }
    
    return [self randomMove: temp_move_list];
}

-(Move *) randomMove: (NSMutableArray *) array {
    int r = arc4random_uniform(array.count);
    return (Move *) array[r];
}

-(NSMutableArray *) getActiveMoveList {
    NSMutableArray * activeMoves = [[NSMutableArray alloc] init];
    Move * current;
    for(int i = 0; i < self.moveList.count; i++) {
        current = (Move *) self.moveList[i];
        if([current isActive]) {
            [activeMoves addObject: current];
        }
    }
    return activeMoves;
}

-(void) printMoveArray: (NSMutableArray *) array {
    Move * current;
    for(int i = 0; i < array.count; i++) {
        current = (Move *) array[i];
        NSLog(@"%@", [current name]);
    }
    NSLog(@"--------------------------");
}

@end