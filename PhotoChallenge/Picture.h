//
//  pic.h
//  PhotoChallenge
//
//  Created by Alex Santorineos on 5/31/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Picture : NSObject
@property UIImage *image;

-(instancetype)initWithImage:(UIImage*)image;
@end
