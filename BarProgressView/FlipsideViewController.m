//
//  FlipsideViewController.m
//  BarProgressView
//
//  Created by Jonathan King on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

@synthesize completeColor = _completeColor;
@synthesize emptyColor = _emptyColor;
@synthesize barWidth = _barWidth;
@synthesize barHeight = _barHeight;
@synthesize barWidthLabel = _barWidthLabel;
@synthesize barHeightLabel = _barHeightLabel;
@synthesize delegate = _delegate;
@synthesize testString = _testString;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", _testString);
    NSLog(@"%f", _barWidth.value);
}

- (void)viewDidUnload
{
    [self setCompleteColor:nil];
    [self setEmptyColor:nil];
    [self setBarWidth:nil];
    [self setBarHeight:nil];
    [self setBarWidthLabel:nil];
    [self setBarHeightLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)heightSliderValueChanged:(UISlider *)sender {
    
    _barHeightLabel.text = [NSString stringWithFormat:@"Bar Height - %0.f px", sender.value];
}

- (IBAction)widthSliderValueChanged:(UISlider *)sender {
    
    _barWidthLabel.text = [NSString stringWithFormat:@"Bar Width - %0.f px", sender.value];
}

- (void)dealloc {
    [_completeColor release];
    [_emptyColor release];
    [_barWidth release];
    [_barHeight release];
    [_barWidthLabel release];
    [_barHeightLabel release];
    [super dealloc];
}
@end
