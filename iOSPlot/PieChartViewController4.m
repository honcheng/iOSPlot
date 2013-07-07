//
//  PieChartViewController4
//  PlotCreator
//
//  Created by Gustavo E Halperin on 8/17/12.
//
//

#import "PieChartViewController4.h"
#import "PCPieChart.h"
#import "PieChartPopover.h"

@interface PieChartViewController4()<PCPieComponentDelegate>

-(UIViewController*)ViewController: (PCPieComponent*)pieComponent;

@end

@implementation PieChartViewController4

- (id)init
{
	self = [super init];
	if (self)
	{
		[self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
		[self setTitle:@"Pie Chart"];
		
		
		int width = [self.view bounds].size.width * 0.75f; //320;
		int height = width / 3.f * 2.2f; // 220;
		PCPieChart *pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(15,//([self.view bounds].size.width-width)/2,
                                                                            ([self.view bounds].size.height-height)/2,width,height)];
		[pieChart setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
		[pieChart setDiameter: 374];// width/2];
		[pieChart setSameColorLabel:YES];
        
        [pieChart setShowInnerCircle:YES];
        [pieChart setTitleInnerCircle:@"Center Title"];
        [pieChart setShowValuesInChart:YES];
        [pieChart setTouchAnimated:YES];
		
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
            component.delegate = self;
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

-(UIViewController*)ViewController: (PCPieComponent*)pieComponent
{
    PieChartPopover *pieChartPopover = [[PieChartPopover alloc] init];
    [pieChartPopover setChartTitle:pieComponent.title];
    [pieChartPopover setChartSubTitle:[NSString stringWithFormat:@"Chart Value %f", pieComponent.value]];
    NSString *content = [NSString stringWithFormat:@"Content for chart %@ and value %f ", pieComponent.title, pieComponent.value];
    for (int i = 0; i < 10; i++) {
        content = [content stringByAppendingString:content];
    }
    [pieChartPopover setChartContent:[NSString stringWithFormat:@"THE CONTENT CAN BE SCROLLED DOWN.\n %@", content]];
    
    return pieChartPopover;
}


@end
