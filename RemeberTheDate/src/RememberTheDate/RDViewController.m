//
//  RDViewController.m
//  RememberTheDate
//
//  Created by NamelessMobile on 07.06.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import "RDViewController.h"
#import "RDGameModel.h"

@interface RDViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cellButtons;

@property (nonatomic, strong) RDGameModel *gameModel;

@end

@implementation RDViewController

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

- (IBAction)cellClick:(UIButton *)sender
{
}

@end
