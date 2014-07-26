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
#import "RDAppDelegate.h"

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

    [self nextQuestion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) cellButtonClick: (RDCellButton *) sender
{
    RDCell *movedCell = [self.gameModel moveCellFromX:sender.x y:sender.y];
    sender.x = movedCell.x;
    sender.y = movedCell.y;
    
    int additionalX = movedCell.x == 0 ? 0 : 5;
    int additionalY = movedCell.y == 0 ? 0 : 5;
    int buttonX = ((90 + additionalX) * movedCell.x) + 20;
    int buttonY = 255 + ((90 + additionalY) * movedCell.y);
    
    [sender setFrame:CGRectMake(buttonX, buttonY, BUTTON_SIZE, BUTTON_SIZE)];
    if([self.gameModel checkGame]) {
        self.lblAnswer.text = @"Ответ верен!";
    }
    else {
        NSLog(@"ответ не верен");
    }
}

- (IBAction)nextQuestion:(UIButton *)sender
{
    [self.gameModel nextQuestion];
    [self generateButtonsByModel];
    
    self.lblQuestion.text = self.gameModel.question;
    self.lblAnswer.text = @"Ответ не верен";
}

-(void) generateButtonsByModel
{
    //RDAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    if(!self.cellButtons){
        self.cellButtons = [[NSMutableArray alloc] initWithCapacity:8];
    }
    
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
    for(UIButton *button in self.cellButtons) {
        [button removeFromSuperview];
    }
    
    [self.cellButtons removeAllObjects];
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
