//
//  WeightObject.m
//  tricking generator
//
//  Created by Bader on 8/10/20.
//  Copyright © 2020 SUNSTRIDER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeightObject.h"

@implementation WeightObject : NSObject 
-(id) init: (NSUInteger) weight : (Move *) move {
    self = [super init];
    if(self) {
        self.move = move;
        self.weight = weight;
    }
    return self;
}
@end
