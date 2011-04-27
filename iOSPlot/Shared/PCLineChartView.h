//
//  LineChartView.h
//  SGElection2011
//
//  Created by honcheng on 3/29/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCLineChartViewComponent : NSObject
{
    NSString *title;
    NSArray *points;
    NSArray *colour;
}
@property (nonatomic, retain) NSArray *points;
@property (nonatomic, retain) NSArray *colour;
@property (nonatomic, retain) NSString *title;
@end

#define PCColorBlue [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:204/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorGreen [NSArray arrayWithObjects:[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:204/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorOrange [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:153/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorRed [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:51/255.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorYellow [NSArray arrayWithObjects:[NSNumber numberWithFloat:255/255.0],[NSNumber numberWithFloat:220/255.0],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:1.0],nil]
#define PCColorDefault [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],nil]


@interface PCLineChartView : UIView {
    NSMutableArray *components;
	NSMutableArray *xLabels;
    int interval;
}

@property (nonatomic, assign) int interval;
@property (nonatomic, retain) NSMutableArray *components, *xLabels;

int sortByNumber(NSNumber *firstComponent, NSNumber *secondComponent, void*context);
int sortLegend(NSMutableDictionary *firstComponent, NSMutableDictionary *secondComponent, void*context);

@end
