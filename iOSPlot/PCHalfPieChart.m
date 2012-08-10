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

#import "PCHalfPieChart.h"

@implementation PCHalfPieComponent

- (id)initWithTitle:(NSString*)title value:(float)value
{
    self = [super init];
    if (self)
    {
        _title = title;
        _value = value;
    }
    return self;
}

+ (id)halfPieComponentWithTitle:(NSString*)title value:(float)value
{
    return [[super alloc] initWithTitle:title value:value];
}

- (NSString*)description
{
    NSMutableString *text = [NSMutableString string];
    [text appendFormat:@"title: %@\n", self.title];
    [text appendFormat:@"value: %f\n", self.value];
    return text;
}

@end

@implementation PCHalfPieChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        _titleFont = [UIFont systemFontOfSize:13];
        _subtitleFont = [UIFont boldSystemFontOfSize:20];
    
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    float origin_x = self.frame.size.width/2;
    float origin_y = self.frame.size.height;
    int margin = self.frame.size.width*0.01;//5;
    float outer_cirlce_radius = self.frame.size.width/2-margin;
    float outer_circle_width = self.frame.size.width*0.05;//15;
    float inner_circle_radius = self.frame.size.width*0.2;//70;
    float inner_circle_width = self.frame.size.width*0.05;//15;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(ctx);
    CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f);  
    CGContextSetShadow(ctx, CGSizeMake(0.0f, 0.0f), margin);
    
    float startDeg = 0;
    float endDeg = 180;
    CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 0.7f);  
    CGContextMoveToPoint(ctx, origin_x, origin_y);
    CGContextAddArc(ctx, origin_x, origin_y, outer_cirlce_radius, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 0);
    CGContextMoveToPoint(ctx, origin_x+outer_cirlce_radius-inner_circle_radius-inner_circle_width, origin_y);
    startDeg = 180;
    endDeg = 0;
    CGContextAddArc(ctx, origin_x, origin_y, inner_circle_radius-inner_circle_width, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 1);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    if ([self.components count]>0)
    {
        int total = 0;
        for (PCHalfPieComponent *component in self.components)
        {
            total += component.value;
        }
        
        float start_degree = 0;
        float end_degree = 0;
        CGContextSetShadow(ctx, CGSizeMake(0.0f, 0.0f), 0);
        for (PCHalfPieComponent *component in self.components)
        {
            float degree = component.value/total*180;
            end_degree = start_degree + degree;
            
            CGContextSetFillColorWithColor(ctx, [component.colour CGColor]);
            CGContextMoveToPoint(ctx, origin_x, origin_y);
            CGContextAddArc(ctx, origin_x, origin_y, outer_cirlce_radius, (start_degree+180)*M_PI/180.0, (end_degree+180)*M_PI/180.0, 0);
            CGContextClosePath(ctx);
            CGContextFillPath(ctx);

            start_degree = end_degree;
        }
        
        if (!self.subtitle)
        {
           self.subtitle = [NSString stringWithFormat:@"%i", total]; 
        }
        
    }
    
    startDeg = 0;
    endDeg = 180;
    CGContextSetRGBFillColor(ctx, 1.0f, 1.0f, 1.0f, 1.0f);  
    CGContextMoveToPoint(ctx, origin_x, origin_y);
    CGContextAddArc(ctx, origin_x, origin_y, inner_circle_radius-inner_circle_width, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    
    CGContextSetShadow(ctx, CGSizeMake(0.0f, 0.0f), margin);
    startDeg = 0;
    endDeg = 180;
    CGContextSetRGBFillColor(ctx, 1.0f, 1.0f, 1.0f, 0.3f);  
    CGContextMoveToPoint(ctx, origin_x, origin_y);
    CGContextAddArc(ctx, origin_x, origin_y, outer_cirlce_radius, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 0);
    CGContextMoveToPoint(ctx, origin_x+outer_cirlce_radius-outer_circle_width, origin_y);
    startDeg = 180;
    endDeg = 0;
    CGContextAddArc(ctx, origin_x, origin_y, outer_cirlce_radius-outer_circle_width, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 1);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    startDeg = 0;
    endDeg = 180;
    CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 0.2f);  
    CGContextMoveToPoint(ctx, origin_x, origin_y);
    CGContextAddArc(ctx, origin_x, origin_y, inner_circle_radius, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 0);
    CGContextMoveToPoint(ctx, origin_x+inner_circle_radius-inner_circle_width, origin_y);
    startDeg = 180;
    endDeg = 0;
    CGContextAddArc(ctx, origin_x, origin_y, inner_circle_radius-inner_circle_width, (startDeg+180)*M_PI/180.0, (endDeg+180)*M_PI/180.0, 1);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    CGContextSetShadow(ctx, CGSizeMake(0.0f, 0.0f), 0);
    CGContextSetRGBFillColor(ctx, 0.0f, 0.0f, 0.0f, 1.0f); 
    if (self.subtitle)
    {
        CGRect textFrame = CGRectMake(self.frame.size.width/2-inner_circle_radius, self.frame.size.height-self.subtitleFont.pointSize-5, 2*inner_circle_radius, self.subtitleFont.pointSize);
        [self.subtitle drawInRect:textFrame withFont:self.subtitleFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
        
    }
    if (self.title)
    {
        CGRect textFrame = CGRectMake(self.frame.size.width/2-inner_circle_radius, self.frame.size.height-self.subtitleFont.pointSize-self.titleFont.pointSize-5, 2*inner_circle_radius, self.titleFont.pointSize);
        [self.title drawInRect:textFrame withFont:self.titleFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentCenter];
        
    }
}


@end
