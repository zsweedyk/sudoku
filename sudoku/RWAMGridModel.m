//
//  RWAMGridModel.m
//  sudoku
//
//  Created by Rachel Wilson on 9/19/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "RWAMGridModel.h"
#import "RWAMGridGenerator.h"

@interface RWAMGridModel() {
    RWAMGridGenerator* _gridGenerator;
    int _grid[9][9];
    bool _mutable[9][9];
}

@end
//int _grid[9][9]={
//    {7,0,0,4,2,0,0,0,9},
//    {0,0,9,5,0,0,0,0,4},
//    {0,2,0,6,9,0,5,0,0},
//    {6,5,0,0,0,0,4,3,0},
//    {0,8,0,0,0,6,0,0,7},
//    {0,1,0,0,4,5,6,0,0},
//    {0,0,0,8,6,0,0,0,2},
//    {3,4,0,9,0,0,1,0,0},
//    {8,0,0,3,0,2,7,4,0}
//};



@implementation RWAMGridModel

- (void) initializeFirstGame
{
    _gridGenerator = [[RWAMGridGenerator alloc] init];
    [_gridGenerator readGridsFile];
    [self startNewGame];
}

- (void) startNewGame
{
    [self generateGrid];
    [self setUpMutable];
}

- (void) generateGrid
{
//    int* gridArray = [_gridGenerator generateGrid];
    [_gridGenerator generateGrid];
    int currentIndex = 0;
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            _grid[row][col] = [_gridGenerator getGridValueAtIndex:currentIndex];
            ++currentIndex;
        }
    }
}

- (void) setUpMutable
{
    for (int row = 0; row<9; ++row) {
        for (int col = 0; col<9; ++col) {
            _mutable[row][col] = !(_grid[row][col]);
        }
    }
}

- (int) getValueAtRow:(int)row andColumn:(int)col
{
    return _grid[row][col];
}

- (void) setValueAtRow:(int)row andColumn:(int)col toValue:(int)value
{
    _grid[row][col] = value;
}

- (bool) isMutableAtRow:(int)row andColumn:(int)col
{
    return _mutable[row][col];
}

- (bool) isConsistentAtRow:(int)row andColumn:(int)col forValue:(int)value
{
    for (int c = 0; c < 9; ++c) {
        if (c != col && _grid[row][c] == value){
            return NO;
        }
    }
    for (int r = 0; r < 9; ++r) {
        if (r != row && _grid[r][col] == value){
            return NO;
        }
    }
    int boxStartRow = row/3 * 3;
    int boxStartCol = col/3 * 3;
    for (int boxRow = boxStartRow; boxRow < (boxStartRow + 3); ++boxRow) {
        for (int boxCol = boxStartCol; boxCol < (boxStartCol + 3); ++boxCol) {
            if (boxCol != col && boxRow != row && _grid[boxRow][boxCol] == value) {
                return NO;
            }
        }
    }
    return YES;
}

/* _____ SAVE AND LOAD FUNCTIONS _____ */

- (void) saveCurrentState
{
    NSMutableString* saveString = [[NSMutableString alloc] init];
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            [saveString appendString: [NSString stringWithFormat:@"%d", _grid[row][col]]];
        }
    }
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            [saveString appendString: [NSString stringWithFormat:@"%d", _mutable[row][col]]];
        }
    }
    NSError* error;
    [saveString writeToFile:[[NSBundle mainBundle] pathForResource:@"save" ofType:@"txt"]
                 atomically:YES
                 encoding:NSUTF8StringEncoding
                 error:&error];
}

- (void) loadSavedState
{
    NSString* saveFile = [[NSBundle mainBundle] pathForResource:@"save" ofType:@"txt"];
    NSError* error;
    
    NSMutableString* savedString = [[NSMutableString alloc] initWithContentsOfFile:saveFile encoding:NSUTF8StringEncoding error:&error];
    int currentIndex = 0;
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            char currentChar = [savedString characterAtIndex:currentIndex];
            int numToAdd = [[NSString stringWithFormat:@"%c", currentChar] intValue];
            _grid[row][col] = numToAdd;
            ++currentIndex;
        }
    }
    
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            char currentChar = [savedString characterAtIndex:currentIndex];
            BOOL numToAdd = [[NSString stringWithFormat:@"%c", currentChar] boolValue];
            _mutable[row][col] = numToAdd;
            ++currentIndex;
        }
    }
    //[self setUpMutable];
    
}

/* _____ RESTART FUNCTION _____ */

- (void) restartGame
{
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            _grid[row][col] = (_grid[row][col] * !_mutable[row][col]);
        }
    }
}

@end
