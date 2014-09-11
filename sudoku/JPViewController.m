//
//  JPViewController.m
//  sudoku
//
//  Created by Josh Petrack on 9/11/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
//

#import "JPViewController.h"

@interface JPViewController () {
    UIButton* _button;
    UIView* _gridView;
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
    _gridView = [[UIView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    // Create button.
    CGFloat buttonSize = size / 5.0;
    CGRect buttonFrame = CGRectMake(0,0,buttonSize,buttonSize);
    _button = [[UIButton alloc] initWithFrame:buttonFrame];
    _button.backgroundColor = [UIColor orangeColor];
    [_gridView addSubview:_button];
    
    // Create target for button.
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Change what the button says.
    [_button setShowsTouchWhenHighlighted:YES];
    [_button setTag:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(id)sender
{
    NSLog(@"Button 1 was pressed.");
}

@end
