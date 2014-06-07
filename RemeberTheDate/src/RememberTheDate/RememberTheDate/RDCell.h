//
//  RDCell.h
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDCell : NSObject

@property (nonatomic) BOOL isEmpty;
@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) NSString *value;

-(BOOL) canMoveTo:(int) x and:(int)y;
-(BOOL) moveTo:(int)x and:(int)y;

@end