//
//  MainViewController.h
//  BarProgressView
//
//  Created by Jonathan King on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "BarProgressView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    
    IBOutlet BarProgressView *progressView;
    IBOutlet UISlider *slider;
}

- (IBAction)valueSliderChangeValue:(UISlider *)sender;
- (IBAction)simulateProgress:(id)sender;

@end
