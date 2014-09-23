//
//  JPGridView.h
//  sudoku
//
//  Created by Josh Petrack on 9/12/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPGridView : UIView

- (NSNumber*) getCurrentRow;

- (NSNumber*) getCurrentColumn;

- (void) setTarget:(id)sender action:(SEL)action;

- (void) setCellatRow:(int)row andColumn:(int)column toValue:(int)value;


@end
