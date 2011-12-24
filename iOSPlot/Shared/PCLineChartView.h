/**
 * Copyright (c) 2011 Muh Hon Cheng
 * Created by honcheng on 28/4/11.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
 * WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR 
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR 
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author 		Muh Hon Cheng <honcheng@gmail.com>
 * @copyright	2011	Muh Hon Cheng
 * @version
 * 
 */

#import <UIKit/UIKit.h>

@interface PCLineChartViewComponent : NSObject
{
    NSString *title;
    NSArray *points;
    UIColor *colour;
	BOOL shouldLabelValues;
}
@property (nonatomic, assign) BOOL shouldLabelValues;
@property (nonatomic, retain) NSArray *points;
@property (nonatomic, retain) UIColor *colour;
@property (nonatomic, retain) NSString *title;
@end


#define PCColorBlue [UIColor colorWithRed:0.0 green:153/255.0 blue:204/255.0 alpha:1.0]
#define PCColorGreen [UIColor colorWithRed:153/255.0 green:204/255.0 blue:51/255.0 alpha:1.0]
#define PCColorOrange [UIColor colorWithRed:1.0 green:153/255.0 blue:51/255.0 alpha:1.0]
#define PCColorRed [UIColor colorWithRed:1.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define PCColorYellow [UIColor colorWithRed:1.0 green:220/255.0 blue:0.0 alpha:1.0]
#define PCColorDefault [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]


@interface PCLineChartView : UIView {
    NSMutableArray *components;
	NSMutableArray *xLabels;
	UIFont *yLabelFont, *xLabelFont, *valueLabelFont, *legendFont;
    float interval;
	float minValue;
	float maxValue;
    
    // Use these to autoscale the y axis to 'nice' values.
    // If used, minValue is ignored (0) and interval computed internally
    BOOL autoscaleYAxis;
    NSUInteger numYIntervals;   // Use n*5 for best results
}

@property (nonatomic, assign) float interval;
@property (nonatomic, assign) float minValue;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, retain) NSMutableArray *components, *xLabels;
@property (nonatomic, retain) UIFont *yLabelFont, *xLabelFont, *valueLabelFont, *legendFont;
@property (nonatomic, assign) BOOL autoscaleYAxis;
@property (nonatomic, assign) NSUInteger numYIntervals;

@end
