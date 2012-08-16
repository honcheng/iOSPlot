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
@synthesize tittle = _tittle;
@synthesize subTittle = _subTittle;
@synthesize content = _content;
@synthesize tittleLabel = _tittleLabel;
@synthesize subTittleLabel = _subTittleLabel;
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
    self.tittleLabel.text = _tittle;
    self.subTittleLabel.text = _subTittle;
    self.contentTextView.text = _content;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setTittle:nil];
    [self setSubTittle:nil];
    [self setContent:nil];
    [self setTittleLabel:nil];
    [self setSubTittleLabel:nil];
    [self setContentTextView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
