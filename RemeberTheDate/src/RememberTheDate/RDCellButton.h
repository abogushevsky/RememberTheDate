//
//  RDCellButton.h
//  RememberTheDate
//
//  Created by Anton Bogushevsky on 15.07.14.
//  Copyright (c) 2014 Anton Bogushevsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDCellButton : UIButton

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) NSString *value;
@property (nonatomic) RDCell *cell;

@end
