//
//  RTMovie.m
//  RottenTomatoes
//
//  Created by Theofanis Pantelides on 6/10/14.
//  Copyright (c) 2014 theo. All rights reserved.
//

#import "RTMovie.h"

@implementation RTMovie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.desc = dictionary[@"synopsis"];
        self.imgLow = dictionary[@"posters"][@"thumbnail"];
        self.imgHigh = dictionary[@"posters"][@"original"];
    }
    
    return self;
}

@end
