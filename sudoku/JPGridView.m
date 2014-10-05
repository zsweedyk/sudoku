//
//  JPGridView.m
//  sudoku
//
//  Created by Rachel on 9/12/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "JPGridView.h"
#import "objc/message.h"

@interface JPGridView (){
    NSMutableArray*  _buttons;
    NSInteger _currentRow;
    NSInteger _currentCol;
    id _target;
    SEL _selector;
    
    NSMutableArray* _backgrounds;
    int _theme;
    
    UIColor* _initialGridFontColor;
}

@end

@implementation JPGridView

- (NSInteger) getCurrentRow
{
    return _currentRow;
}

- (NSInteger) getCurrentColumn
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
        [self initThemes];
        
        _initialGridFontColor = [UIColor colorWithRed:174.0f/255.0f green:226.0f/255.0f blue:232.0f/255.0f alpha:1.0f];
        
        
        for (int row = 0; row < 9; ++row) {
            // We want a thick padding on the border of the board.
            currentX = thickSeparationDistance;
            
            NSMutableArray* currentRow;
            currentRow = [[NSMutableArray alloc] initWithCapacity:9];
            
            for (int col = 0; col < 9; ++col) {
                // Make button.
                CGRect buttonFrame = CGRectMake(currentX,currentY,buttonSize,buttonSize);
                UIButton* _button = [[UIButton alloc] initWithFrame:buttonFrame];
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
    _currentRow = (NSInteger)tempButton.tag / 9;
    _currentCol = (NSInteger)tempButton.tag % 9;
//    void (*response)(id, SEL) = (void (*)(id, SEL)) objc_msgSend;
//    response(_target, _selector);
//    IMP imp = [_target methodForSelector:_selector];
//    imp(_target, _selector);
    [_target performSelector:_selector];
}

- (void)setCellatRow:(int)row andColumn:(int)column toValue:(int)value andInitial:(BOOL)initial
{
    UIButton* button = [[_buttons objectAtIndex:row] objectAtIndex: column];
    if (value !=0) {
        [button setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
        if (_theme == 0) {
            [button setBackgroundImage:nil forState:UIControlStateNormal];
        }
        else {
            [button setBackgroundImage:_backgrounds[_theme-1][value-1] forState:UIControlStateNormal];
        }
    }
    else {
        [button setTitle: @"" forState:UIControlStateNormal];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
    }
    if (initial) {
        [button setTitleColor:_initialGridFontColor forState:UIControlStateNormal];
    }
    else {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (void)setTarget:(id)sender action:(SEL)action
{
    _target = sender;
    _selector = action;
}

- (void) changeTheme
{
    _theme = ++_theme % ([_backgrounds count]+1);
}

- (void) initThemes
{
    _backgrounds = [[NSMutableArray alloc] init];
    
    NSMutableArray* kittens = [[NSMutableArray alloc] initWithCapacity:9];
    //insert jpgs to kittens array
    for (int i = 1; i<10; ++i) {
        [kittens addObject:[UIImage imageNamed:[NSString stringWithFormat:@"kitten%d.jpg", i]]];
    }
    [_backgrounds addObject:kittens];
}

- (void) setButtonBackgroundColor:(UIColor*)color
{
    for (int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            UIButton* button = _buttons[row][col];
            button.backgroundColor = color;
        }
    }

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
