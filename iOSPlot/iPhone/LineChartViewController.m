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

#import "LineChartViewController.h"
#import "JSONKit.h"

@implementation LineChartViewController

- (id)init
{
	self = [super init];
	if (self)
	{
		[self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
		[self setTitle:@"Line Chart"];
		
		_lineChartView = [[PCLineChartView alloc] initWithFrame:CGRectMake(10,10,[self.view bounds].size.width-20,[self.view bounds].size.height-20)];
		[_lineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
		_lineChartView.minValue = -40;
		_lineChartView.maxValue = 100;
		[self.view addSubview:_lineChartView];
		
		NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_linechart_data.json"];
		NSString *jsonString = [NSString stringWithContentsOfFile:sampleFile encoding:NSUTF8StringEncoding error:nil];
		
        NSDictionary *sampleInfo = [jsonString objectFromJSONString];
        
        NSMutableArray *components = [NSMutableArray array];
		for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
		{
			NSDictionary *point = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
			PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
			[component setTitle:[point objectForKey:@"title"]];
			[component setPoints:[point objectForKey:@"data"]];
			[component setShouldLabelValues:NO];
			
			if (i==0)
			{
				[component setColour:PCColorYellow];
			}
			else if (i==1)
			{
				[component setColour:PCColorGreen];
			}
			else if (i==2)
			{
				[component setColour:PCColorOrange];
			}
			else if (i==3)
			{
				[component setColour:PCColorRed];
			}
			else if (i==4)
			{
				[component setColour:PCColorBlue];
			}
			
			[components addObject:component];
		}
		[_lineChartView setComponents:components];
		[_lineChartView setXLabels:[sampleInfo objectForKey:@"x_labels"]];
	}
	return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	[self.lineChartView setNeedsDisplay];
    return YES;
}

@end
