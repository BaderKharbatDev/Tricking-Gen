//
//  Move.h
//  kickboxing app
//
//  Created by Bader on 5/19/20.
//  Copyright © 2020 SunStrider. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    chest_forward = 1,
    chest_back = 2,
    forwards = 3,
    backwards = 4
} Stance;

@interface Move : NSObject
-(id)init: (NSString *) name : (Stance) take_off : (Stance) landing : (BOOL *) take_off_swing : (BOOL *) landing_swing : (BOOL *) generates_tumbling_momentum : (BOOL *) requires_tumbling_momentum;
@property NSString* name;
@property Stance take_off_stance;
@property Stance landing_stance;
@property BOOL * take_off_swing; //does the take off require a swing
@property BOOL * landing_can_swing; //is it possible to swing out of it
@property BOOL * generates_tumbling_momentum;
@property BOOL * requires_tumbling_momentum;
@property BOOL * isActive;
@end
