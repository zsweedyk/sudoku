//
//  JPGridView.h
//  sudoku
//
//  Created by Josh Petrack on 9/12/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
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
