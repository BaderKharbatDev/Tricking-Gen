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
-(id)init: (NSString *) name : (Stance) take_off : (Stance) landing;
@property NSString* name;
@property Stance take_off_stance;
@property Stance landing_stance;
@property BOOL * isActive;
@end
