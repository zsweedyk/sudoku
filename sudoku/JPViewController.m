//
//  JPViewController.m
//  sudoku
//
//  Created by Josh Petrack on 9/11/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "JPViewController.h"
#import "JPGridView.h"
#import "RWAMGridModel.h"
#import "RWAMNumPadView.h"
#import "RWAMButtonsView.h"

@interface JPViewController () {
    
    JPGridView* _gridView;
    RWAMGridModel* _gridModel;
    RWAMNumPadView* _numPadView;
    RWAMButtonsView* _buttonsView;
}

@end

@implementation JPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create grid frame.
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x,y,size,size);
    
    // Create grid view.
    _gridView = [[JPGridView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    [_gridView setTarget:self action:@selector(gridCellSelected:)];
    
    // Create numpad view.
    CGFloat spaceBetweenViews = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.02;
    CGFloat numPadY = y + size + spaceBetweenViews;
    
    CGRect numPadFrame = CGRectMake(x, numPadY, size, size * .10);
    _numPadView = [[RWAMNumPadView alloc] initWithFrame:numPadFrame];
    _numPadView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_numPadView];
    
    //Create Buttons view.
    CGFloat newGameButtonY = numPadY + spaceBetweenViews + size*.10;
    CGRect buttonViewFrame = CGRectMake(x, newGameButtonY, size, size*.30);
    _buttonsView = [[RWAMButtonsView alloc] initWithFrame:buttonViewFrame];
    _buttonsView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_buttonsView];
    [_buttonsView setTarget:self action:@selector(newGame:)];
    
    _gridModel = [[RWAMGridModel alloc] init];
    
    [_gridModel initializeFirstGame];
    [self setInitialGrid];
    
}

- (void)gridCellSelected:(id)sender
{
    NSInteger selectedRow = [_gridView getCurrentRow];
    NSInteger selectedCol = [_gridView getCurrentColumn];
    
    [self validateInputForRow:selectedRow andColumn:selectedCol];
}

- (void) newGame:(id)sender;
{
    [_gridModel startNewGame];
    [self setInitialGrid];
}

-(void)validateInputForRow: (NSInteger)row andColumn: (NSInteger)col
{
    if ([_gridModel isMutableAtRow:row andColumn:col]) {
        NSInteger currentValue = [_numPadView getCurrentValue];
        if (currentValue == 0) {
            [_gridView setCellatRow:row andColumn:col toValue:currentValue];
        }
        else {
            if ([_gridModel isConsistentAtRow:row andColumn:col forValue:currentValue]) {
                [_gridView setCellatRow:row andColumn:col toValue:currentValue];
                [_gridModel setValueAtRow:row andColumn:col toValue:currentValue];
            }
        }
    }
}

- (void)setInitialGrid {
    for(int row = 0; row < 9; ++row) {
        for (int col = 0; col < 9; ++col) {
            int currentValue = [_gridModel getValueAtRow:row andColumn:col];
            [_gridView setCellatRow:row andColumn:col toValue:currentValue];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
