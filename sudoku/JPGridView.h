//
//  JPGridView.h
//  sudoku
//
//  Created by Rachel Wilson and Amit Maor on 9/12/14.
//  Copyright (c) 2014 Rachel Wilson and Amit Maor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPGridView : UIView

- (NSInteger) getCurrentRow;

- (NSInteger) getCurrentColumn;

- (void) setTarget:(id)sender action:(SEL)action;

- (void) setCellatRow:(int)row andColumn:(int)column toValue:(int)value andInitial:(BOOL)initial;

- (void) changeTheme;

- (void) setButtonBackgroundColor:(UIColor*)color;

@end
