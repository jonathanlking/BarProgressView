//
//  MainViewController.m
//  BarProgressView
//
//  Created by Jonathan King on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {

int selectedCompleteColorSegment;
int selectedEmptyColorSegment;
float barWidthSlider;
float barHeightSlider;

}

@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    selectedCompleteColorSegment = 0;
    selectedEmptyColorSegment = 0;
    barWidthSlider = progressView.widthOfBar;
    barHeightSlider = progressView.frame.size.height;
}

- (void)viewDidUnload
{
    [progressView release];
    progressView = nil;
    [slider release];
    slider = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    progressView.frame = CGRectMake(progressView.frame.origin.x, progressView.frame.origin.y, progressView.frame.size.width, controller.barHeight.value);
    progressView.widthOfBar = controller.barWidth.value;
    
    NSArray *completeColorArray = [[NSArray alloc] initWithObjects:[UIColor blackColor], [UIColor whiteColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
    progressView.completeBarFillColor = [completeColorArray objectAtIndex:controller.completeColor.selectedSegmentIndex];
    
    NSArray *emptyColorArray = [[NSArray alloc] initWithObjects:[UIColor blackColor], [UIColor whiteColor], [UIColor grayColor], nil];
    progressView.emptyBarFillColor = [emptyColorArray objectAtIndex:controller.emptyColor.selectedSegmentIndex];
    
    [completeColorArray release];
    [emptyColorArray release];
    
    selectedCompleteColorSegment = controller.completeColor.selectedSegmentIndex;
    selectedEmptyColorSegment = controller.emptyColor.selectedSegmentIndex;
    barWidthSlider = controller.barWidth.value;
    barHeightSlider = controller.barHeight.value;
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        
        FlipsideViewController *settings = [segue destinationViewController];
        
        settings.completeColor.selectedSegmentIndex = selectedCompleteColorSegment;
        settings.emptyColor.selectedSegmentIndex = selectedEmptyColorSegment;
        settings.barWidth.value = barWidthSlider;
        settings.barHeight.value = barHeightSlider;
        settings.testString = @"Test is complete!";        
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)dealloc {
    [progressView release];
    [slider release];
    [super dealloc];
}

- (IBAction)valueSliderChangeValue:(UISlider *)sender {
    
    progressView.progress = sender.value;

}

- (IBAction)simulateProgress:(id)sender {
    
    [self slide];
}

- (void)slide {
    
    progressView.progress = progressView.progress +0.01;
    slider.value = progressView.progress;
    if (progressView.progress != 1)[self performSelector:@selector(slide) withObject:nil afterDelay:0.05];
}

@end
