//
//  RDViewController.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDViewController.h"
#import "RDGameModel.h"
#import "RDCellButton.h"

@interface RDViewController ()

@property (nonatomic, strong) RDGameModel *gameModel;
@property (nonatomic, strong) NSMutableArray *cellButtons;

@end

@implementation RDViewController

const int BUTTON_SIZE = 90;

-(RDGameModel *) gameModel
{
    if(!_gameModel) {
        _gameModel = [[RDGameModel alloc] init];
    }
    
    return _gameModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.lblAnswer.text = self.gameModel.answer;
    self.lblQuestion.text = self.gameModel.question;
    self.cellButtons = [NSMutableArray arrayWithCapacity:9]; //there are always 9 non-empty cells
    
    int buttonSize = 90;
    RDCellButton *button = [RDCellButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 260, buttonSize, buttonSize);
    button.value = @"0";
    button.backgroundColor = [UIColor redColor];
    button.x = 0;
    button.y = 0;
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextQuestion:(UIButton *)sender
{
    _gameModel = [[RDGameModel alloc] initWithQuestionId: 0];
    
    for(int i = 0; i < _gameModel.gameCells.count; i++) {
        //нужен либо двумерный массив, либо ячейки в модели должны быть отсортированы
    }
}

-(RDCellButton *) createButtonForCell: (RDCell *) cell
{
    RDCellButton *button = [RDCellButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10 * (cell.x + 1) + 10, 250 * (cell.y + 1) + 10, BUTTON_SIZE, BUTTON_SIZE);
    button.value = @"0";
    button.backgroundColor = [UIColor redColor];
    button.x = 0;
    button.y = 0;
    
    return button;
}

@end
