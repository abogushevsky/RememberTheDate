//
//  RDCell.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDCell.h"

@implementation RDCell

@synthesize isEmpty = _isEmpty;
@synthesize x = _x;
@synthesize y = _y;
@synthesize value = _value;

-(BOOL) canMoveTo:(int) x and:(int)y
{
    return NO;
}

-(BOOL) moveTo:(int)x and:(int)y
{
    return NO;
}

-(instancetype) initWithValue:(NSString *)value atX:(int)x andY:(int)y
{
    self = [self init];
    
    _isEmpty = NO;
    _value = value;
    _x = x;
    _y = y;
    
    return self;
}

-(instancetype) initEmptyAt:(int)x And:(int)y
{
    self = [self init];
    
    _isEmpty = YES;
    _value = @" ";
    _x = x;
    _y = y;
    
    return self;
}

@end
