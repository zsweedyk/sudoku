//
//  RWAMGridModel.m
//  sudoku
//
//  Created by Rachel Wilson on 9/19/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "RWAMGridModel.h"

int _grid[9][9]={
    {7,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

bool _mutable[9][9];

@implementation RWAMGridModel

- (void) startNewGame;
{
    // [self generateGrid];
    [self setUpMutable];
}

- (void) setUpMutable;
{
    for (int row = 0; row<9; ++row) {
        for (int col = 0; col<9; ++col) {
            _mutable[row][col] = !(_grid[row][col]);
        }
    }
}

- (int) getValueAtRow:(int)row andColumn:(int)col;
{
    return _grid[row][col];
}

- (void) setValueAtRow:(int)row andColumn:(int)col toValue:(int)value;
{
    _grid[row][col] = value;
}
- (bool) isMutableAtRow:(int)row andColumn:(int)col;
{
    return _mutable[row][col];
}
- (bool) isConsistentAtRow:(int)row andColumn:(int)col forValue:(int)value;
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
            return NO;
        }
    }
    return YES;
}

@end
