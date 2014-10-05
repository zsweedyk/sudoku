//
//  RWAMButtonsView.m
//  sudoku
//
//  Created by Rachel Wilson on 9/27/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "RWAMButtonsView.h"

@interface RWAMButtonsView() {
    id _target;
//    SEL _relevantSelector;
    
    NSArray* _buttonTitles;
    NSMutableArray* _buttons;
    NSMutableArray* _buttonSelectors;
    
}

@end



@implementation RWAMButtonsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // We want all buttons to be the same size, so we determine these values first.
        CGFloat height = CGRectGetHeight(frame);
        CGFloat verticalSeparationDistance = height*.04;
        CGFloat buttonHeight = height*.44;
        
        CGFloat width = CGRectGetWidth(frame);
        CGFloat horizontalSeparationDistance = verticalSeparationDistance;
        CGFloat buttonWidth = (width - 4*(horizontalSeparationDistance))/3;
        
        _buttonTitles = [[NSArray alloc] init];
        _buttonSelectors = [[NSMutableArray alloc] init];
        
        int currentX = horizontalSeparationDistance, currentY = verticalSeparationDistance;
        NSInteger buttonIndex = 0;
        
        NSString* titleNames = @"New Game, Save, Load, Themes, Music, Restart";
        _buttonTitles = [titleNames componentsSeparatedByString:@", "];
        
        
        _buttons = [[NSMutableArray alloc] initWithCapacity:2];
        for (int row = 0; row < 2; ++row) {
            NSMutableArray* currentRow = [[NSMutableArray alloc] initWithCapacity:3];
            for (int col = 0; col < 3; ++col) {
                CGRect buttonFrame = CGRectMake(currentX, currentY, buttonWidth, buttonHeight);
                UIButton* button = [[UIButton alloc] initWithFrame:buttonFrame];
                [button addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
                button.backgroundColor = [UIColor orangeColor];
                [self addSubview:button];
                currentX += buttonWidth + horizontalSeparationDistance;
                [button setTitle:[_buttonTitles objectAtIndex:buttonIndex] forState:UIControlStateNormal];
                [button setTag:buttonIndex];
                button.showsTouchWhenHighlighted = YES;
                if (buttonIndex == 0) {
                    button.titleLabel.font = [UIFont systemFontOfSize:10];
                }
                [currentRow addObject:button];
                ++buttonIndex;
            }
            [_buttons addObject:currentRow];
            currentX = horizontalSeparationDistance;
            currentY += verticalSeparationDistance + buttonHeight;
        }
        
    }
    return self;
}

- (void) buttonPressed:(id)sender
{
    UIButton* tempButton = (UIButton*) sender;
    SEL relevantSelector = [[_buttonSelectors objectAtIndex:tempButton.tag] pointerValue];
//    IMP imp = [_target methodForSelector:_relevantSelector];
//    imp(_target, _relevantSelector);
     [_target performSelector:relevantSelector];
}

- (void) setTarget:(id)sender action:(SEL)action
{
    _target = sender;
    if ([NSStringFromSelector(action)  isEqual: @"newGame:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:0];
    }
    if ([NSStringFromSelector(action)  isEqual: @"saveCurrentState:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:1];
    }
    if ([NSStringFromSelector(action)  isEqual: @"loadSavedState:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:2];
    }
    if ([NSStringFromSelector(action)  isEqual: @"changeTheme:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:3];
    }
    if ([NSStringFromSelector(action)  isEqual: @"toggleMusic:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:4];
    }
    if ([NSStringFromSelector(action)  isEqual: @"restartGame:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:5];
    }
}

- (void) setButtonBackgroundColor:(UIColor*)color
{
    for (int row = 0; row < 2; ++row) {
        for (int col = 0; col < 3; ++col) {
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
