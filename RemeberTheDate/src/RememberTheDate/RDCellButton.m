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
@synthesize cell = _cell;

-(RDCell *) cell
{
    return _cell;
}

-(void) setCell: (RDCell *) newCell
{
    _cell = newCell;
    [self setTitle:newCell.value forState:UIControlStateNormal];
    //change position
}

-(NSString *) value
{
    return self.titleLabel.text;
}

-(void) setValue: (NSString *) 	newValue
{
    [self setTitle:newValue forState:UIControlStateNormal];
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
