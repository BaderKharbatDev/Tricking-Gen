//
//  Move.h
//  kickboxing app
//
//  Created by Bader on 5/19/20.
//  Copyright © 2020 SunStrider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Move.h"
#include <stdlib.h>
#import "WeightObject.h"


@interface MoveManager : NSObject
-(id)init;
-(NSMutableArray *)generate: (int) size;
@property NSMutableArray * moveCatList;
@property NSMutableArray * moveList;
@end
