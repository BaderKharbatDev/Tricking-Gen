//
//  Move.m
//  kickboxing app
//
//  Created by Bader on 5/19/20.
//  Copyright © 2020 Nebo. All rights reserved.
//

#import "MoveManager.h"

@implementation MoveManager : NSObject
//auto generated by compiler
-(id)init {
    self = [super init];
    if(self) {
        self.moveCatList = [[NSMutableArray alloc] init];
        NSMutableArray * normal_kicks = [[NSMutableArray alloc] init];
        NSMutableArray * pop_kicks = [[NSMutableArray alloc] init];
        NSMutableArray * cheat_kicks = [[NSMutableArray alloc] init];
        NSMutableArray * swing_kicks = [[NSMutableArray alloc] init];
        NSMutableArray * flat_spins = [[NSMutableArray alloc] init];
        NSMutableArray * flat_twists = [[NSMutableArray alloc] init];
        NSMutableArray * backward_flips = [[NSMutableArray alloc] init];
        NSMutableArray * backward_twists = [[NSMutableArray alloc] init];
        NSMutableArray * forward_flips = [[NSMutableArray alloc] init];
        NSMutableArray * forward_twists = [[NSMutableArray alloc] init];
        NSMutableArray * outside_flips = [[NSMutableArray alloc] init];
        NSMutableArray * outside_twists = [[NSMutableArray alloc] init];
        NSMutableArray * inside_tricks = [[NSMutableArray alloc] init];
        
        NSArray * catArray = @[normal_kicks, pop_kicks, cheat_kicks, swing_kicks, flat_spins, flat_twists, backward_flips, backward_twists, forward_flips, forward_twists, outside_flips, outside_twists, inside_tricks];
        
        NSArray * catArrayString = @[@"normal_kicks", @"pop_kicks", @"cheat_kicks", @"swing_kicks", @"flat_spins", @"flat_twists", @"backward_flips", @"backward_twists", @"forward_flips", @"forward_twists", @"outside_flips", @"outside_twists", @"inside_tricks"];
        
        //fill each category
        for(int i = 0; i < catArray.count; i++) {
            NSMutableArray * cat = (NSMutableArray *) catArray[i];
            NSArray * moveArray = [Move getMovesInCat: catArrayString[i]];
            for(int n = 0; n < moveArray.count; n++) {
                [cat addObject: (Move *) moveArray[n] ];
            }
        }
        
        //add each category to cat list
        for(int i = 0; i < catArray.count; i++) {
            [self.moveCatList addObject: (NSMutableArray *) catArray[i]];
        }
        
        //adds all moves to a global move list
        self.moveList = [[NSMutableArray alloc] init];
        for(int i = 0; i < self.moveCatList.count; i++) {
            for(int n = 0; n < [(NSMutableArray *) self.moveCatList[i] count]; n++) {
                [_moveList addObject: (Move *) [(NSMutableArray *) self.moveCatList[i] objectAtIndex:n] ];
            }
        }
        
    }
    return self;
}
//-----------------------Structured Generation-----------------------------
-(NSMutableArray *)generateStructured: (int) size : (int) difficulty {
    int n = size;
    int p;
    switch (difficulty) {
        case 1:
            p = 2 * n;
            break;
        case 2:
            p = 3 * n;
            break;
        case 3:
            p = 4 * n;
            break;
    }
    NSMutableArray * rv = [[NSMutableArray alloc] init];
    
    //get ending move (must have weight of p/2 where p is 2n, 3n, or 4n depending on difficulty
    int max_move_weight = p/2;
    NSArray * activeMoves = [self getActiveMoveList];
    NSMutableArray * iterate_one = [[NSMutableArray alloc] init];
    int highest_valid_weight = 1;
    for(Move * m in activeMoves) {
        if(m.finishStatus <= max_move_weight) {
            if(m.finishStatus > highest_valid_weight) {
                [iterate_one removeAllObjects];
                highest_valid_weight = m.finishStatus;
            }
            [iterate_one addObject:m];
        }
    }
    
    Move * current = [self randomMove: iterate_one];
    [rv addObject:current];
    NSLog(@"Last Object: %@", current.name);
    max_move_weight = p - current.finishStatus;
    
    //For each n left, choose a move that ensures the remaining spots still have at least 1 unit
    for(int i = size - 1; i > 0; i--) {
        NSMutableArray * available = [self getPreviousMoveListHelper: current];
        for(int i = 0; i < available.count; i++) { //weed out moves that weigh too high
            Move * m = available[i];
            if(max_move_weight - m.finishStatus < (size - 1)) { //each move must make p >= n left
                [available removeObjectAtIndex:i];
                i--;
            }
        }
        
        //add it
        current = [self randomMove: available];
        [rv insertObject: current atIndex:0];
        
        //recalc max weight
        max_move_weight = max_move_weight - current.finishStatus;
    }
    
    [self printMoveArray: rv];
    
    return rv;
}



//-----------------------Creative Generation------------------------------

-(NSMutableArray *)generateCreative: (int) size {
    NSMutableArray * rv = [[NSMutableArray alloc] init];
    
    Move * current = [self randomMove: [self getActiveMoveList]];
    [rv addObject: current];
    
    for(int i = 0; i < size - 1; i++) {
        current = [self randomMove: [self getNextMoveListHelper: current] ];
        [rv addObject: current];
    }
    [self printMoveArray: rv];
    return rv;
}

//----------------------HELPER GENERATION METHODS-------------------------

-(NSArray *) getNextMoveListHelper: (Move *) old {
    NSMutableArray * temp_move_list = [[NSMutableArray alloc] init];
    NSMutableArray * activeMoveList = [self getActiveMoveList];
    WeightObject * obj;
    int highestScore = 0;
    for(int i = 0; i < activeMoveList.count; i++) {
        obj = [[WeightObject alloc] init: 1 : (Move *) activeMoveList[i]];
        //check for repeating move
        if(old == obj.move)
            obj.weight -= 1;
        
        //check matching stance
        if(old.landing_stance == obj.move.take_off_stance)
            obj.weight += 3;
            
        //check compatible stances
        switch(old.landing_stance) {
            case 1: //old move ends in 1
                if(obj.move.take_off_stance == 3)//forward tricks are compatable
                    obj.weight += 2;
                break;
            case 2: //old move ends in 1
                if(obj.move.take_off_stance == 4)//forward tricks are compatable
                    obj.weight += 2;
                break;
            case 3: //old move ends in 1
                if(obj.move.take_off_stance == 2)//forward tricks are compatable
                    obj.weight += 3;
                break;
            case 4: //old move ends in 1
                if(obj.move.take_off_stance == 1)//forward tricks are compatable
                    obj.weight += 2;
                break;
        }
        
        //check swing compatability
        if(old.landing_can_swing && obj.move.take_off_swing) {
            obj.weight += 3;
        } else if (!old.landing_can_swing && !obj.move.take_off_swing) {
            obj.weight += 3;
        }
        
        //adds the move to moveList
        [temp_move_list addObject:obj];
        
        if(obj.weight > highestScore)
            highestScore = obj.weight;
    }
    
    //select move
    NSMutableArray * highestMoves = [[NSMutableArray alloc] init];
    WeightObject * n;
    //add heighest weighted moves
    for(int i = 0; i < temp_move_list.count; i++) {
        n = (WeightObject *) temp_move_list[i];
        if(n.weight == highestScore)
            [highestMoves addObject: n.move];
    }
    //add second heighest weighted moves for variance
    int variance = 0;
    for(int i = 0; i < temp_move_list.count; i++) {
        n = (WeightObject *) temp_move_list[i];
        if(n.weight >= highestScore - variance)
            [highestMoves addObject: n.move];
    }
        
    return highestMoves;
}

-(NSArray *) getPreviousMoveListHelper: (Move *) old {
    NSMutableArray * temp_move_list = [[NSMutableArray alloc] init];
    NSMutableArray * activeMoveList = [self getActiveMoveList];
    WeightObject * obj;
    int highestScore = 0;
    for(int i = 0; i < activeMoveList.count; i++) {
        obj = [[WeightObject alloc] init: 1 : (Move *) activeMoveList[i]];
        //check for repeating move
        if(old == obj.move)
            obj.weight -= 1;
        
        //check matching stance
        if(old.take_off_stance == obj.move.landing_stance)
            obj.weight += 3;
            
        //check compatible stances
        switch(old.take_off_stance) {
            case 1: //old move ends in 1
                if(obj.move.landing_stance == 4)//forward tricks are compatable
                    obj.weight += 2;
                break;
            case 2: //old move ends in 1
                if(obj.move.landing_stance == 3)//forward tricks are compatable
                    obj.weight += 2;
                break;
            case 3: //old move ends in 1
                if(obj.move.landing_stance == 1)//forward tricks are compatable
                    obj.weight += 3;
                break;
            case 4: //old move ends in 1
                if(obj.move.landing_stance == 2)//forward tricks are compatable
                    obj.weight += 2;
                break;
        }
        
        //check swing compatability
        if(old.take_off_swing && obj.move.landing_can_swing) {
            obj.weight += 3;
        } else if (!old.take_off_swing && !obj.move.landing_can_swing) {
            obj.weight += 3;
        }
        
        //adds the move to moveList
        [temp_move_list addObject:obj];
        
        if(obj.weight > highestScore)
            highestScore = obj.weight;
    }
    
    //select move
    NSMutableArray * highestMoves = [[NSMutableArray alloc] init];
    WeightObject * n;
    //add heighest weighted moves
    for(int i = 0; i < temp_move_list.count; i++) {
        n = (WeightObject *) temp_move_list[i];
        if(n.weight == highestScore)
            [highestMoves addObject: n.move];
    }
    //add second heighest weighted moves for variance
    int variance = 0;
    for(int i = 0; i < temp_move_list.count; i++) {
        n = (WeightObject *) temp_move_list[i];
        if(n.weight >= highestScore - variance)
            [highestMoves addObject: n.move];
    }
        
    return highestMoves;
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

-(Move *) randomMove: (NSMutableArray *) array {
    int r = arc4random_uniform(array.count);
    return (Move *) array[r];
}

@end
