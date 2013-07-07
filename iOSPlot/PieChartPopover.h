//
//  PieChartPopover.h
//  PlotCreator
//
//  Created by gustavo halperin on 8/16/12.
//
//

#import <UIKit/UIKit.h>

@interface PieChartPopover : UIViewController

@property (strong, nonatomic) IBOutlet NSString *chartTitle;
@property (strong, nonatomic) IBOutlet NSString *chartSubTitle;
@property (strong, nonatomic) IBOutlet NSString *chartContent;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;

@end
