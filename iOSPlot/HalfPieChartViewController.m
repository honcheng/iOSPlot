//
//  HalfPieChartViewController.m
//  PlotCreator
//
//  Created by honcheng on 5/4/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import "HalfPieChartViewController.h"
#import "PCHalfPieChart.h"

@implementation HalfPieChartViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        [self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
		[self setTitle:@"Half Pie Chart"];
		
		
		int height = [self.view bounds].size.height-20;
		int width = [self.view bounds].size.width;
		PCHalfPieChart *pieChart = [[PCHalfPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height)/2,width,height)];
		[pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin];
		//[pieChart setDiameter:width/2];
		[self.view addSubview:pieChart];
		
		if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
		{
			pieChart.titleFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
			pieChart.subtitleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:50];
		}
        
        [pieChart setTitle:@"Total"];
        //[pieChart setSubtitle:@"Chart subtitle"];
		
		NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_piechart_data.plist"];
		NSDictionary *sampleInfo = [NSDictionary dictionaryWithContentsOfFile:sampleFile];
		NSMutableArray *components = [NSMutableArray array];
		for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
		{
			NSDictionary *item = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
			PCHalfPieComponent *component = [PCHalfPieComponent halfPieComponentWithTitle:[item objectForKey:@"title"] value:[[item objectForKey:@"value"] floatValue]];
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


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
