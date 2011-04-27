    //
//  GenericViewController.m
//  PlotCreator
//
//  Created by honcheng on 4/24/11.
//  Copyright 2011 honcheng. All rights reserved.
//

#import "GenericViewController.h"


@implementation GenericViewController
@synthesize titleLabel;

- (id)init
{
	self = [super init];
	if (self)
	{
		
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,150,30)];
		[self.titleLabel setBackgroundColor:[UIColor clearColor]];
		[self.titleLabel setTextColor:[UIColor whiteColor]];
		[self.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20]];
		[self.navigationItem setTitleView:self.titleLabel];
		[self.titleLabel release];
		[self.titleLabel setTextAlignment:UITextAlignmentCenter];
		
		UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,60,40)];
		[backButton setBackgroundImage:[UIImage imageNamed:@"back_button.png"] forState:UIControlStateNormal];
		[backButton setTitle:@"Back" forState:UIControlStateNormal];
		[[backButton titleLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:12]];
		[backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
		UIBarButtonItem *backButtonitem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		[backButton release];
		[self.navigationItem setLeftBarButtonItem:backButtonitem];
		[backButtonitem release];
		[backButton addTarget:self action:@selector(onBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[backButton setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
	}
	return self;
}

- (void)onBackButtonPressed:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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


- (void)dealloc {
	[self.titleLabel release];
    [super dealloc];
}


@end
