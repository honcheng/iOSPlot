/**
 * Copyright (c) 2010 Muh Hon Cheng
 * Created by honcheng on 12/11/10.
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
 * @copyright	2010	Muh Hon Cheng
 * @version
 * 
 */

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
