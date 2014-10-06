//
//  RWAMNumPadView.m
//  sudoku
//
//  Created by Rachel Wilson on 9/21/14.
//  Copyright (c) 2014 Rachel Wilson and Amit Maor. All rights reserved.
//

#import "RWAMNumPadView.h"

@interface RWAMNumPadView ()
{
    NSMutableArray*  _buttons;
    int _currentValue;
    UIColor* _backgroundColor;
}

@end

@implementation RWAMNumPadView

- (int)getCurrentValue
{
    return _currentValue;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat buttonSeparationDistance = 1.0;
        CGFloat longSide = MAX(CGRectGetHeight(frame), CGRectGetWidth(frame));
        // We want 11 small separations, and there are 10 buttons.
        CGFloat buttonSize = (longSide - 11 * buttonSeparationDistance) / 10;
        // This ensures that we were given a frame that can hold the buttons.
        CGFloat shortSide = MIN(CGRectGetHeight(frame), CGRectGetWidth(frame));
        NSAssert(buttonSize <= shortSide, @"NumPadFrame is not tall enough.");
        
        _buttons = [[NSMutableArray alloc] initWithCapacity:10];
        
        CGFloat currentX = buttonSeparationDistance;
        CGFloat y = (shortSide - buttonSize) /2;
        for (int buttonValue = 0; buttonValue < 10; ++buttonValue) {
            CGRect buttonFrame = CGRectMake(currentX, y, buttonSize, buttonSize);
            UIButton* button = [[UIButton alloc] initWithFrame:buttonFrame];
            button.backgroundColor = [UIColor magentaColor];
            [self addSubview:button];
            [button setTag:buttonValue];
            [button addTarget:self action:@selector(cellSelected:) forControlEvents:UIControlEventTouchUpInside];
            if (buttonValue != 0) {
                [button setTitle:[NSString stringWithFormat:@"%i", buttonValue] forState:UIControlStateNormal];
            }
            currentX += buttonSize + buttonSeparationDistance;
            [_buttons addObject:button];
        }
    }
    return self;
}

- (void)cellSelected:(id)sender
{
    UIButton* tempButton = (UIButton*) sender;
    ((UIButton*) _buttons[_currentValue]).backgroundColor = _backgroundColor;
    _currentValue = tempButton.tag;
    ((UIButton*) _buttons[_currentValue]).backgroundColor = [UIColor blackColor];
}

- (void) setButtonBackgroundColor:(UIColor*)color
{
    _backgroundColor = color;
    for (int pos = 0; pos < 10; ++pos) {
        UIButton* button = _buttons[pos];
        button.backgroundColor = color;
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
