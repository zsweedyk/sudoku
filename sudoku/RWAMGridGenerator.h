//
//  RWAMGridGenerator.h
//  sudoku
//
//  Created by Rachel Wilson on 9/25/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWAMGridGenerator : NSObject

- (void) readGridsFile;

- (int *) generateGrid;

@end
