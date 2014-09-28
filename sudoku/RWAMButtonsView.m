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
    
    NSArray* _buttonTitles;
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
        CGFloat horizontalSeparationDistance = width*.04;
        CGFloat buttonWidth = width*.28;
        
        _buttonTitles = [[NSArray alloc] init];
        _buttonSelectors = [[NSMutableArray alloc] init];
        
        int currentX = horizontalSeparationDistance, currentY = verticalSeparationDistance;
        NSInteger buttonIndex = 0;
        
        NSString* titleNames = @"New Game, Save, Load, Themes, Music, Restart";
        _buttonTitles = [titleNames componentsSeparatedByString:@", "];
        
        
        
        for (int row = 0; row < 2; ++row) {
            for (int col = 0; col < 3; ++col) {
                CGRect buttonFrame = CGRectMake(currentX, currentY, buttonWidth, buttonHeight);
                UIButton* button = [[UIButton alloc] initWithFrame:buttonFrame];
                [button addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
                button.backgroundColor = [UIColor orangeColor];
                [self addSubview:button];
                currentX += buttonWidth + horizontalSeparationDistance;
                [button setTitle:[_buttonTitles objectAtIndex:buttonIndex] forState:UIControlStateNormal];
                [button setTag:buttonIndex];
                if (buttonIndex == 0) {
                    button.titleLabel.font = [UIFont systemFontOfSize:10];
                }
                ++buttonIndex;
//                if (row == 0) {
//                    if (col == 0) {
//                        [button setTitle:@"New Game" forState:UIControlStateNormal];
//                        button.titleLabel.font = [UIFont systemFontOfSize:10];
//                    }
//                    if (col == 1) {
//                        [button setTitle:@"Save" forState:UIControlStateNormal];
//                    }
//                    if (col == 2) {
//                        [button setTitle:@"Load" forState:UIControlStateNormal];
//                    }
//                }
//                if (row == 1) {
//                    if (col == 0) {
//                        [button setTitle:@"Themes" forState:UIControlStateNormal];
//                    }
//                    if (col == 1) {
//                        [button setTitle:@"Music" forState:UIControlStateNormal];
//                    }
//                    if (col == 2) {
//                        [button setTitle:@"Restart" forState:UIControlStateNormal];
//                    }
//                }
                
            }
            currentX = horizontalSeparationDistance;
            currentY += verticalSeparationDistance + buttonHeight;
        }
        
    }
    return self;
}

- (void) buttonPressed:(id)sender;
{
    UIButton* tempButton = (UIButton*) sender;
    SEL relevantSelector = [[_buttonSelectors objectAtIndex:tempButton.tag] pointerValue];
    [_target performSelector:relevantSelector];
}

- (void) setTarget:(id)sender action:(SEL)action;
{
    _target = sender;
    if ([NSStringFromSelector(action)  isEqual: @"newGame:"]) {
        [_buttonSelectors insertObject:[NSValue valueWithPointer:action] atIndex:0];
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
