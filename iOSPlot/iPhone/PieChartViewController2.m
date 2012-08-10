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

#import "PieChartViewController2.h"
#import "PCPieChart.h"

@implementation PieChartViewController2

- (id)init
{
	self = [super init];
	if (self)
	{
		[self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
		[self setTitle:@"Pie Chart"];
		
		
		int height = [self.view bounds].size.width/3*2.; // 220;
		int width = [self.view bounds].size.width; //320;
		PCPieChart *pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height)/2,width,height)];
		[pieChart setShowArrow:NO];
		[pieChart setSameColorLabel:YES];
		[pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
		[pieChart setDiameter:width/2];
		[self.view addSubview:pieChart];
		
		if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
		{
			pieChart.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30];
			pieChart.percentageFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:50];
		}
		
		NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_piechart_data.plist"];
		NSDictionary *sampleInfo = [NSDictionary dictionaryWithContentsOfFile:sampleFile];
		NSMutableArray *components = [NSMutableArray array];
		for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
		{
			NSDictionary *item = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
			PCPieComponent *component = [PCPieComponent pieComponentWithTitle:[item objectForKey:@"title"] value:[[item objectForKey:@"value"] floatValue]];
			[components addObject:component];
			
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
		}
		[pieChart setComponents:components];
		
	}
	return self;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
