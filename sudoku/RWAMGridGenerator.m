//
//  RWAMGridGenerator.m
//  sudoku
//
//  Created by Rachel Wilson on 9/25/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "RWAMGridGenerator.h"

int _gridsArray[9][9][9];

@implementation RWAMGridGenerator

- (void) readGridsFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grid1" ofType:@"txt"];
    NSError* error;
    
    NSString* readString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    int currentGrid = 0;
    
//    while (!(readString empty)) {
//        take first 81 elements of readString
//        for rows up to 9
//            for cols up to 9
//                check if . and handle this case
//                place next char (atoi) in _gridsArray[currentGrid][row][col]
//        ++currentGrid
//        cut off first 81 chars of readstring or use skiptonewline type function
//    }
//        
    
}

- (int *) generateGrid;
{
    return 3;
}

@end
