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
