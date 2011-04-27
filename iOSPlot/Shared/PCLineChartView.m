//
//  LineChartView.m
//  SGElection2011
//
//  Created by honcheng on 3/29/11.
//  Copyright 2011 BuUuK Pte Ltd. All rights reserved.
//

#import "PCLineChartView.h"

@implementation PCLineChartViewComponent
@synthesize title, points, colour;
@end

@implementation PCLineChartView
@synthesize components;
@synthesize interval;
@synthesize xLabels;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.interval = 20;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //NSLog(@"%@", self.components);
    float max_value = 100;
    float min_value = 0;
	
	/*
    NSMutableArray *x_labels = [NSMutableArray array];
    NSMutableDictionary *percentages = [NSMutableDictionary dictionary];
    
    for (PCLineChartViewComponent *component in self.components)
    {
        for (NSMutableDictionary *point in component.points)
        {
            float value = [[point objectForKey:@"perc"] floatValue];
            if (value>0)
            {
                if (value>max_value) max_value = value;
                if (value<min_value && value>0) min_value = value;
                
                int x_label = [[point objectForKey:@"x_label"] intValue];
                NSNumber *label = [NSNumber numberWithInt:x_label];
                if ([x_labels indexOfObject:label]==NSNotFound)
                {
                    [x_labels addObject:label];
                }
                
                NSString *x_label_key = [NSString stringWithFormat:@"%@", [point objectForKey:@"x_label"]];
                if (![percentages objectForKey:x_label_key])
                {
                    [percentages setObject:[NSMutableArray array] forKey:x_label_key];
                }
                [[percentages objectForKey:x_label_key] addObject:[point objectForKey:@"perc"]];
            }
            
        }
    }*/
    
    /*
    for (int i=0; i<100; i+=self.interval)
    {
        if (i>max_value)
        {
            max_value = i;
            break;
        }
    }
    
    for (int i=100; i>=0; i-=self.interval)
    {
        if (i<min_value)
        {
            min_value = i;
            break;
        }
    }
    
    if (min_value==20) min_value = 10;*/
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(ctx);
    CGContextSetRGBFillColor(ctx, 0.2f, 0.2f, 0.2f, 1.0f);
    
    
    int n_div = (max_value-min_value)/self.interval + 1;
    float top_margin = 35;
    float bottom_margin = 25;
	float x_label_height = 20;
    float div_height = (self.frame.size.height-top_margin-bottom_margin-x_label_height)/(n_div-1);

    for (int i=0; i<n_div; i++)
    {
        float y_axis = max_value - i*self.interval;

        int y = top_margin + div_height*i;
        CGRect textFrame = CGRectMake(0,y-8,25,20);
        NSString *text = [NSString stringWithFormat:@"%.0f", y_axis];
        [text drawInRect:textFrame withFont:[UIFont systemFontOfSize:12] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentRight];
		
        CGContextSetLineWidth(ctx, 1);
        CGContextSetRGBStrokeColor(ctx, 0.4f, 0.4f, 0.4f, 0.1f);
        CGContextMoveToPoint(ctx, 30, y);
        CGContextAddLineToPoint(ctx, self.frame.size.width-30, y);
        CGContextStrokePath(ctx);
    }
    
    float margin = 45;
    float div_width = (self.frame.size.width-2*margin)/([self.xLabels count]-1);
    for (int i=0; i<[self.xLabels count]; i++)
    {
        int x = margin + div_width*i;
        NSString *x_label = [NSString stringWithFormat:@"%@", [self.xLabels objectAtIndex:i]];
        CGRect textFrame = CGRectMake(x-100, self.frame.size.height-x_label_height,200,x_label_height);
        [x_label drawInRect:textFrame withFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:14] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
    }
    
	
    NSMutableArray *legends = [NSMutableArray array];
    
    float circle_diameter = 10;
    float circle_stroke_width = 3;
    float line_width = 4;
    for (PCLineChartViewComponent *component in self.components)
    {
        int last_x = 0;
        int last_y = 0;
        

		for (int x_axis_index=0; x_axis_index<[component.points count]; x_axis_index++)
        {
			float value = [[component.points objectAtIndex:x_axis_index] floatValue];
			
            if (value>0)
            {
                NSArray *colour = component.colour;
                
                CGContextSetRGBStrokeColor(ctx, [[colour objectAtIndex:0] floatValue], [[colour objectAtIndex:1] floatValue], [[colour objectAtIndex:2] floatValue], [[colour objectAtIndex:3] floatValue]);
                CGContextSetLineWidth(ctx, circle_stroke_width);
                
                int x = margin + div_width*x_axis_index;
                int y = top_margin + (max_value-value)/self.interval*div_height;
                
                CGRect circleRect = CGRectMake(x-circle_diameter/2, y-circle_diameter/2, circle_diameter,circle_diameter);
                CGContextStrokeEllipseInRect(ctx, circleRect);
                
                CGContextSetRGBFillColor(ctx, [[colour objectAtIndex:0] floatValue], [[colour objectAtIndex:1] floatValue], [[colour objectAtIndex:2] floatValue], [[colour objectAtIndex:3] floatValue]);
                
                if (last_x!=0 && last_y!=0)
                {
                    float distance = sqrt( pow(x-last_x, 2) + pow(y-last_y,2) );
                    float last_x1 = last_x + (circle_diameter/2) / distance * (x-last_x);
                    float last_y1 = last_y + (circle_diameter/2) / distance * (y-last_y);
                    float x1 = x - (circle_diameter/2) / distance * (x-last_x);
                    float y1 = y - (circle_diameter/2) / distance * (y-last_y);
                    
                    CGContextSetLineWidth(ctx, line_width);
                    CGContextMoveToPoint(ctx, last_x1, last_y1);
                    CGContextAddLineToPoint(ctx, x1, y1);
                    CGContextStrokePath(ctx);
                }
                
				
                if (x_axis_index==[component.points count]-1)
                {
                    NSMutableDictionary *info = [NSMutableDictionary dictionary];
                    [info setObject:component.title forKey:@"title"];
                    [info setObject:[NSNumber numberWithFloat:x+circle_diameter/2+15] forKey:@"x"];
                    [info setObject:[NSNumber numberWithFloat:y-10] forKey:@"y"];
					[info setObject:component.colour forKey:@"colour"];
                    [legends addObject:info];
				}
                
                last_x = x;
                last_y = y;
            }
            
        }
    }
    
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpace, CGColorGetComponents([UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor));
    CGContextSetShadowWithColor(ctx, CGSizeMake(0,-1), 1, color);
    for (int i=0; i<[self.xLabels count]; i++)
    {
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:13];
        int y_level = top_margin;
        
        for (int j=0; j<[components count]; j++)
        {
			NSArray *items = [[components objectAtIndex:j] points];
            float value = [[items objectAtIndex:i] floatValue];
            int x = margin + div_width*i;
            int y = top_margin + (max_value-value)/self.interval*div_height;
            int y1 = y - circle_diameter/2 - font.pointSize;
            int y2 = y + circle_diameter/2;
            
            if (y1 > y_level)
            {
                CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f);
                NSString *perc_label = [NSString stringWithFormat:@"%.1f%%", value];
                CGRect textFrame = CGRectMake(x-25,y1, 50,20);
                [perc_label drawInRect:textFrame withFont:font lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
                y_level = y1 + 20;
            }
            else if (y2 < y_level+20 && y2 < self.frame.size.height-top_margin-bottom_margin)
            {
                CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f);
                NSString *perc_label = [NSString stringWithFormat:@"%.1f%%", value];
                CGRect textFrame = CGRectMake(x-25,y2, 50,20);
                [perc_label drawInRect:textFrame withFont:font lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
                y_level = y2 + 20;
            }
            else
            {
                CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f);
                NSString *perc_label = [NSString stringWithFormat:@"%.1f%%", value];
                CGRect textFrame = CGRectMake(x-50,y-10, 50,20);
                [perc_label drawInRect:textFrame withFont:font lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
                y_level = y1 + 20;
            }
            
            if (y+circle_diameter/2>y_level) y_level = y+circle_diameter/2;
        }
    }
    
    [legends sortUsingFunction:&sortLegend context:NULL];
    //CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f);
    float y_level = 0;
    for (NSMutableDictionary *legend in legends)
    {
		NSArray *colour = [legend objectForKey:@"colour"];
		CGContextSetRGBFillColor(ctx, [[colour objectAtIndex:0] floatValue], [[colour objectAtIndex:1] floatValue], [[colour objectAtIndex:2] floatValue], [[colour objectAtIndex:3] floatValue]);

		
        NSString *title = [legend objectForKey:@"title"];
        float x = [[legend objectForKey:@"x"] floatValue];
        float y = [[legend objectForKey:@"y"] floatValue];
        if (y<y_level)
        {
            y = y_level;
        }
        
        CGRect textFrame = CGRectMake(x,y,margin,15);
        [title drawInRect:textFrame withFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:14]];
        
        y_level = y + 15;
    }
}

- (void)dealloc
{
    [self.components release];
    [super dealloc];
}

int sortByNumber(NSNumber *firstComponent, NSNumber *secondComponent, void*context)
{
	return [secondComponent compare:firstComponent];
}

int sortLegend(NSMutableDictionary *firstComponent, NSMutableDictionary *secondComponent, void*context)
{
	return [[firstComponent objectForKey:@"y"] compare:[secondComponent objectForKey:@"y"]];
}

@end
