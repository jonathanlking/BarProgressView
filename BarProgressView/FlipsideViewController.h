//
//  FlipsideViewController.h
//  BarProgressView
//
//  Created by Jonathan King on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController {

}

@property (retain, nonatomic) NSString *testString;
@property (retain, nonatomic) IBOutlet UISegmentedControl *completeColor;
@property (retain, nonatomic) IBOutlet UISegmentedControl *emptyColor;
@property (retain, nonatomic) IBOutlet UISlider *barWidth;
@property (retain, nonatomic) IBOutlet UISlider *barHeight;
@property (retain, nonatomic) IBOutlet UILabel *barWidthLabel;
@property (retain, nonatomic) IBOutlet UILabel *barHeightLabel;

@property (assign, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)heightSliderValueChanged:(UISlider *)sender;
- (IBAction)widthSliderValueChanged:(UISlider *)sender;

@end
