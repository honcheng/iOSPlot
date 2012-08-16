//
//  PieChartPopover.h
//  PlotCreator
//
//  Created by gustavo halperin on 8/16/12.
//
//

#import <UIKit/UIKit.h>

@interface PieChartPopover : UIViewController

@property (strong, nonatomic) IBOutlet NSString *tittle;
@property (strong, nonatomic) IBOutlet NSString *subTittle;
@property (strong, nonatomic) IBOutlet NSString *content;

@property (strong, nonatomic) IBOutlet UILabel *tittleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTittleLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;

@end
