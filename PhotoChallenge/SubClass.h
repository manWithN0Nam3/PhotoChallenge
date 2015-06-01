//
//  SubClass.h
//  PhotoChallenge
//
//  Created by Alex Santorineos on 5/31/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SubClass : NSObject

@property (copy, nonatomic) NSString *imageID;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userFullName;
@property (copy, nonatomic) NSString *userProfilePictureURL;
@property (copy, nonatomic) NSString *imageThumbnailURL;
@property (copy, nonatomic) NSString *imageLowResURL;
@property (copy, nonatomic) NSString *imageStdResURL;

@property NSDictionary *dictionary;

-(instancetype)initWithDictionary:(NSDictionary *)jsonDic;


@end
