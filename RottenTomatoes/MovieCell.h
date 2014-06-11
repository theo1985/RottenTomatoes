//
//  MovieCell.h
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/9/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;

@end
