//
//  ChartView.h
//  SGElection2011
//
//  Created by honcheng on 3/25/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCPieChart.h"

@interface PCPieComponent : NSObject
{
    float value, startDeg, endDeg;
    NSString *title;
    NSArray *colour;
    
}
@property (nonatomic, assign) float value, startDeg, endDeg;
@property (nonatomic, retain) NSArray *colour;
@property (nonatomic, retain) NSString *title;


- (id)initWithTitle:(NSString*)_title value:(float)_value;
+ (id)pieComponentWithTitle:(NSString*)_title value:(float)_value;
@end

#define PCColorBlue [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:204/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorGreen [NSArray arrayWithObjects:[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:204/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorOrange [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorRed [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorYellow [NSArray arrayWithObjects:[NSNumber numberWithFloat:255/255.0],[NSNumber numberWithFloat:220/255.0],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorDefault [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],nil]

@interface PCPieChart : UIView {
    NSMutableArray *components;
    int diameter;
	UIFont *titleFont, *percentageFont;
}
@property (nonatomic, assign) int diameter;
@property (nonatomic, retain) NSMutableArray *components;
@property (nonatomic, retain) UIFont *titleFont, *percentageFont;

@end
