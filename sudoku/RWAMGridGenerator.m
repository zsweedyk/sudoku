//
//  RWAMGridGenerator.m
//  sudoku
//
//  Created by Rachel Wilson on 9/25/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "RWAMGridGenerator.h"

@interface RWAMGridGenerator() {
    NSArray* _textGrids;
    
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
    
//    NSInteger count = [_textGrids count];
//    for(int i = 0; i < count; ++i) {
//        NSLog(@"Grid %d is %@", i, _textGrids[i]);
//    }
    
    
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
