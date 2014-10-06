//
//  RWAMGridGenerator.m
//  sudoku
//
//  Created by Rachel Wilson on 9/25/14.
//  Copyright (c) 2014 Rachel Wilson and Amit Maor. All rights reserved.
//

#import "RWAMGridGenerator.h"

@interface RWAMGridGenerator() {
    NSArray* _textGrids;
    NSInteger _count;
    
    int _mostRecentGrid[81];
}

@end



@implementation RWAMGridGenerator

- (void) readGridsFile
{
    NSString* path1 = [[NSBundle mainBundle] pathForResource:@"grid1" ofType:@"txt"];
    NSError* error;
    
    NSMutableString* readString = [[NSMutableString alloc] initWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error];
    
    NSString* path2 = [[NSBundle mainBundle] pathForResource:@"grid2" ofType:@"txt"];
    
    [readString appendString: [[NSString alloc] initWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:&error]];
    
    _textGrids = [[NSArray alloc] init];
    _textGrids = [readString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    _count = [_textGrids count];       
    
}

- (void) generateGrid
{
    NSString* gridToUse = _textGrids[arc4random_uniform(_count)];

    int currentIndex = 0;
    for (int row = 0; row<9; ++row) {
        for (int col=0; col<9; ++col) {
            char currentChar = [gridToUse characterAtIndex:currentIndex];
            if(currentChar == '.') {
                _mostRecentGrid[currentIndex] = 0;
            }
            else {
                int numToAdd = [[NSString stringWithFormat:@"%c", currentChar] intValue];
                _mostRecentGrid[currentIndex] = numToAdd;
            }
            ++currentIndex;
        }
    }
}

- (int) getGridValueAtIndex:(int)index
{
    return _mostRecentGrid[index];
}

@end
