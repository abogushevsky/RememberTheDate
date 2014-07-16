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
    [self nextQuestion:nil];
    self.lblQuestion.text = self.gameModel.question;
    self.lblAnswer.text = self.gameModel.answer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) cellButtonClick: (RDCellButton *) sender
{
    NSLog(@"Button pressed: %@", sender.value);
    RDCell *movedCell = [self.gameModel moveCellFromX:sender.x y:sender.y];
    sender.x = movedCell.x;
    sender.y = movedCell.y;
    
    int additionalX = movedCell.x == 0 ? 0 : 5;
    int additionalY = movedCell.y == 0 ? 0 : 5;
    int buttonX = ((90 + additionalX) * movedCell.x) + 20;
    int buttonY = 255 + ((90 + additionalY) * movedCell.y);
    
    [sender setFrame:CGRectMake(buttonX, buttonY, BUTTON_SIZE, BUTTON_SIZE)];
    NSLog(@"Button moved to %d and %d", sender.x, sender.y);
}

- (IBAction)nextQuestion:(UIButton *)sender
{
    _gameModel = [[RDGameModel alloc] initWithQuestionId: 0];
    
    [self generateButtonsByModel];
}

-(void) generateButtonsByModel
{
    [self clearCurrentButtons];
    
    for(int i = 0; i < self.gameModel.gameCells.count; i++) {
        RDCellButton *button = [self createButtonForCell:self.gameModel.gameCells[i]];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.cellButtons addObject:button];
    }
}

-(void) clearCurrentButtons
{
    
}

-(RDCellButton *) createButtonForCell: (RDCell *) cell
{
    RDCellButton *button = [RDCellButton buttonWithType:UIButtonTypeSystem];
    int additionalX = cell.x == 0 ? 0 : 5;
    int additionalY = cell.y == 0 ? 0 : 5;
    int buttonX = ((90 + additionalX) * cell.x) + 20;
    int buttonY = 255 + ((90 + additionalY) * cell.y);
    button.frame = CGRectMake(buttonX, buttonY, BUTTON_SIZE, BUTTON_SIZE);
    button.value = cell.value;
    [button setBackgroundColor:[UIColor colorWithRed:168.0f/255.0f green:199.0f/255.0f blue:240.0f/255.0f alpha:1]];
    button.x = cell.x;
    button.y = cell.y;
    
    return button;
}

@end
