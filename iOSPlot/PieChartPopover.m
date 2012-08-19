//
//  PieChartPopover.m
//  PlotCreator
//
//  Created by gustavo halperin on 8/16/12.
//
//

#import "PieChartPopover.h"

@interface PieChartPopover ()

@end

@implementation PieChartPopover
@synthesize chartTitle = _chartTitle;
@synthesize chartSubTitle = _chartSubTitle;
@synthesize chartContent = _chartContent;
@synthesize titleLabel = _titleLabel;
@synthesize subTitleLabel = _subTitleLabel;
@synthesize contentTextView = _contentTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = _chartTitle;
    self.subTitleLabel.text = _chartSubTitle;
    self.contentTextView.text = _chartContent;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setChartTitle:nil];
    [self setChartSubTitle:nil];
    [self setChartContent:nil];
    [self setTitleLabel:nil];
    [self setSubTitleLabel:nil];
    [self setContentTextView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
