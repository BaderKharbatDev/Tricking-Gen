//
//  WeightObject.h
//  tricking generator
//
//  Created by Bader on 8/10/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import "Move.h"

#ifndef WeightObject_h
#define WeightObject_h

@interface WeightObject : NSObject
@property Move * move;
@property (readwrite) NSInteger weight;
-(id) init: (NSUInteger) weight : (Move *) move;
@end

#endif /* WeightObject_h */
