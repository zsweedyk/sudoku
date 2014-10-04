//
//  RWAMGridModel.h
//  sudoku
//
//  Created by Rachel Wilson on 9/19/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWAMGridModel : NSObject

- (void) initializeFirstGame;
- (void) startNewGame;
- (int) getValueAtRow:(int)row andColumn:(int)col ;
- (void) setValueAtRow:(int)row andColumn:(int)col toValue:(int)value;
- (bool) isMutableAtRow:(int)row andColumn:(int)col;
- (bool) isConsistentAtRow:(int)row andColumn:(int)col forValue:(int)value;
- (void) saveCurrentState;
- (void) loadSavedState;
- (void) restartGame;

@end
