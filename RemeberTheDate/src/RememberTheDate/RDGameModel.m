//
//  RDGameModel.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDGameModel.h"

@implementation RDGameModel

@synthesize question = _question;
@synthesize answer = _answer;
@synthesize gameCells = _gameCells;
@synthesize emptyCell = _emptyCell;

-(instancetype) init
{
    self = [super init];
    
    NSLog(@"Game model initialization");
    
    _question = @"What is the capital of Great Britain?";
    _answer = @"02.02.2014";
    
    return self;
}

-(instancetype) initWithQuestionId: (NSInteger) questionId
{
    self = [self init];
    
    NSLog(@"Init with question Id %d", questionId);
    
    _question = @"Дата начала Великой Отечественной Войны";
    _answer = @"22.06.1941";
    NSMutableArray *datePartsArray = [NSMutableArray arrayWithObjects:@"2", @"2", @"0", @"6", @"1", @"9", @"4", @"1", nil];
    
    _gameCells = [NSArray arrayWithObjects:
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:1 andY:0],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:2 andY:0],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:0 andY:1],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:1 andY:1],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:2 andY:1],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:0 andY:2],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:1 andY:2],
                  [[RDCell alloc] initWithValue:[self getRandomDatePartFromPartsArray:datePartsArray] atX:2 andY:2],
                  nil];
    _emptyCell = [[RDCell alloc] initEmptyAt:0 And:0];
    
    return self;
}

-(RDCell *) moveCellFromX:(int)x y:(int)y
{
    RDCell *movedCell;
    for(int i = 0; i < self.gameCells.count; i++){
        movedCell = self.gameCells[i];
        if(movedCell.x == x && movedCell.y == y){
            if([self canMoveCell:movedCell toX:self.emptyCell.x y:self.emptyCell.y]){
                [movedCell moveTo:self.emptyCell.x and:self.emptyCell.y];
                [self.emptyCell moveTo:x and:y];
            }
            break;
        }
    }
    
    return movedCell;
}

-(NSString *) getRandomDatePartFromPartsArray: (NSMutableArray *)array
{
    int rnd = rand() % array.count;
    NSString *result = (NSString*)[array objectAtIndex:rnd];
    [array removeObjectAtIndex:rnd];
    return result;
}

-(BOOL) canMoveCell:(RDCell*)cell toX:(int)x y:(int)y
{
    return (cell.x == x && abs(cell.y - y) <= 1) || (cell.y == y && abs(cell.x - x) <= 1);
}

@end
