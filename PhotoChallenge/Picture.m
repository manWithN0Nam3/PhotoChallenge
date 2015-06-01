//
//  pic.m
//  PhotoChallenge
//
//  Created by Alex Santorineos on 5/31/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "Picture.h"

@implementation Picture


-(instancetype)initWithImage:(UIImage*)image{

    self = [super init];
    if (self) {

        self.image = image;



    }

    return self;
}

@end
