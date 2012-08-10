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

#import "ChartListViewController.h"
#import "PieChartViewController.h"
#import "PieChartViewController2.h"
#import "LineChartViewController.h"
#import "HalfPieChartViewController.h"

@implementation ChartListViewController


#pragma mark -
#pragma mark Initialization

- (id)init
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self)
	{
		[self setTitle:@"iOSPlot"];
	}
	return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		[cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];
		[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
    
    if (indexPath.row==0)
	{
		[cell.textLabel setText:@"Pie Chart with arrows"];
	}
	else if (indexPath.row==1)
	{
		[cell.textLabel setText:@"Pie Chart without arrows"];
	}
    else if (indexPath.row==2)
	{
		[cell.textLabel setText:@"Half Pie Chart (not completed yet)"];
	}
	else if (indexPath.row==3)
	{
		[cell.textLabel setText:@"Line Chart"];
	}
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row==0)
	{
		PieChartViewController *detailViewController = [[PieChartViewController alloc] init];
		[self.navigationController pushViewController:detailViewController animated:YES];
	}
    else if (indexPath.row==1)
	{
		PieChartViewController2 *detailViewController = [[PieChartViewController2 alloc] init];
		[self.navigationController pushViewController:detailViewController animated:YES];
	}
    else if (indexPath.row==2)
	{
		HalfPieChartViewController *detailViewController = [[HalfPieChartViewController alloc] init];
		[self.navigationController pushViewController:detailViewController animated:YES];
	}
	else if (indexPath.row==3)
	{
		LineChartViewController *detailViewController = [[LineChartViewController alloc] init];
		[self.navigationController pushViewController:detailViewController animated:YES];
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}




@end

