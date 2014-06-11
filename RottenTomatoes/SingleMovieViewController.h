//
//  SingleMovieViewController.h
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/10/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTMovie.h"

@interface SingleMovieViewController : UIViewController {
    RTMovie *rtMovie;
}

@property (nonatomic, retain) RTMovie *rtMovie;

@end
