//
//  RDGameModel.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDGameModel.h"
#import "RDRandomQuestionSelector.h"

@interface RDGameModel()

@property (nonatomic) RDQuestion *questionObj;
@property (nonatomic) RDRandomQuestionSelector *questionSelector;

@end

@implementation RDGameModel

@synthesize question = _question;
@synthesize answer = _answer;
@synthesize gameCells = _gameCells;
@synthesize emptyCell = _emptyCell;

@synthesize questionObj = _questionObj;
@synthesize questionSelector = _questionSelector;

-(NSString *) question
{
    return self.questionObj.question;
}

-(NSString *) answer
{
    return [self getStringFromDate:self.questionObj.answer];
}

-(instancetype) init
{
    self = [super init];
    _questionSelector = [[RDRandomQuestionSelector alloc] init];
    
    return self;
}

-(instancetype) initWithQuestion:(RDQuestion *)question
{
    self = [self init];
    _questionObj = question;
    return self;
}

-(instancetype) initWithQuestionId: (NSInteger) questionId
{
    self = [self init];
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

-(void) nextQuestion
{
    _questionObj = [self.questionSelector getRandomQuestion];
    NSString *answerTemp = self.answer;
    NSMutableArray *datePartsArray = [[NSMutableArray alloc] initWithCapacity:answerTemp.length];
    
    for(int i = 0; i < answerTemp.length; i++) {
        NSString *datePart = [NSString stringWithFormat:@"%c", [answerTemp characterAtIndex:i]];
        if([datePart  isEqual: @"/"] || [datePart  isEqual: @"\\"]) {
            continue;
        }
        
        [datePartsArray addObject: datePart];
    }
    
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
}

-(NSString *) getStringFromDate:(NSDate *) date
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSString *format = [NSDateFormatter dateFormatFromTemplate:@"ddMMyyyy" options:0 locale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

@end
