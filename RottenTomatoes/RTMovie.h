//
//  RTMovie.h
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/10/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTMovie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *imgLow;
@property (nonatomic, strong) NSString *imgHigh;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
