//
//  BarProgressView.h
//  BarProgressView
//
//  Created by Jonathan King on 22/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define defaultWidthOfBar 10 //Default width in pixels, which can be changed with the 'widthOfBar' property.
#define defaultSpaceBetweenBars 1 //Space in pixels between the bars, edit this constant to change the width.

#define defaultCompleteBarFillColor [UIColor colorWithRed:179.0/255.0f green:203.0/255.0f blue:7.0/255.0f alpha:1] //The color the bars will be when they are 'complete'
#define defaultEmptyBarFillColor [UIColor colorWithRed:101.0/255.0f green:105.0/255.0f blue:87.0/255.0f alpha:1] //The color the bars will be when they are 'empty'

@interface BarProgressView : UIView {}

@property (nonatomic) int widthOfBar;
@property (nonatomic) float progress;

@property (nonatomic, retain) UIColor *completeBarFillColor;
@property (nonatomic, retain) UIColor *emptyBarFillColor;

@end
