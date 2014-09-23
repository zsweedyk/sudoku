//
//  JPGridView.m
//  sudoku
//
//  Created by Rachel on 9/12/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "JPGridView.h"

@interface JPGridView (){
    NSMutableArray*  _buttons;
    NSNumber* _currentRow;
    NSNumber* _currentCol;
    id _target;
    SEL _action;
}

@end

@implementation JPGridView

- (NSNumber*) getCurrentRow
{
    return _currentRow;
}

- (NSNumber*) getCurrentColumn
{
    return _currentCol;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
        CGFloat thinSeparationDistance = 1.0;
        CGFloat thickSeparationDistance = 2.0;
        
        // On the Sudoku grid, there are 6 thin lines in each direction
        // separating rows and columns, and 4 thicker lines.
        CGFloat buttonSize = ((size - (6 * thinSeparationDistance + 4 * thickSeparationDistance)) / 9.0);
        
        CGFloat currentY = thickSeparationDistance;
        CGFloat currentX;
        
        _buttons = [[NSMutableArray alloc] initWithCapacity:9];
        
        
        for (int row = 0; row < 9; ++row) {
            // We want a thick padding on the border of the board.
            currentX = thickSeparationDistance;
            
            NSMutableArray* currentRow;
            currentRow = [[NSMutableArray alloc] initWithCapacity:9];
            
            for (int col = 0; col < 9; ++col) {
                // Make button.
                CGRect buttonFrame = CGRectMake(currentX,currentY,buttonSize,buttonSize);
                UIButton* _button = [[UIButton alloc] initWithFrame:buttonFrame];
                _button.backgroundColor = [UIColor orangeColor];
                [self addSubview:_button];
                [_button setTag:9*row + col];
                [_button setShowsTouchWhenHighlighted:YES];
                [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                
                [currentRow insertObject:_button atIndex:col];
                // 3x3 boxes should be separated with a thick border.
                if (col % 3 == 2) {
                    currentX += buttonSize + thickSeparationDistance;
                }
                // other columns separated with thin border.
                else {
                    currentX += buttonSize + thinSeparationDistance;
                }
            }
            
            // Insert the new sub-array of buttons into the main array.
            [_buttons insertObject:currentRow atIndex:row];
            // Same logic as above for border width.
            if (row % 3 == 2) {
                currentY += buttonSize + thickSeparationDistance;
            }
            else {
                currentY += buttonSize + thinSeparationDistance;
            }
        }
    }
    return self;
}

- (void)buttonPressed:(id)sender
{
    UIButton* tempButton = (UIButton*) sender;
    _currentRow = [NSNumber numberWithInt:tempButton.tag / 9];
    _currentCol = [NSNumber numberWithInt:tempButton.tag % 9];
    [_target performSelector:_action];
}

- (void)setCellatRow:(int)row andColumn:(int)column toValue:(int)value {
    UIButton* button = [[_buttons objectAtIndex:row] objectAtIndex: column];
    if (value !=0) {
        [button setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
    }
    else {
        [button setTitle: @"" forState:UIControlStateNormal];
    }
}

- (void)setTarget:(id)sender action:(SEL)action
{
    _target = sender;
    _action = action;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
