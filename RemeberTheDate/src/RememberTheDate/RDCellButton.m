//
//  RDCellButton.m
//  RememberTheDate
//
//  Created by Anton Bogushevsky on 15.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDCellButton.h"

@implementation RDCellButton

@synthesize x = _x;
@synthesize y = _y;
@synthesize value;

-(NSString *) value
{
    return self.titleLabel.text;
}

-(void) setValue: (NSString *) 	newValue
{
    self.value = newValue;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
