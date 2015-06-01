//
//  SubClass.m
//  PhotoChallenge
//
//  Created by Alex Santorineos on 5/31/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "SubClass.h"

@interface NSObject ()

@property NSMutableArray *arrays;
@end


@implementation SubClass
//- (id) initWithCoder:(NSCoder *)aDecoder {
//
//}

-(instancetype)initWithDictionary:(NSDictionary *)jsonDic{

    self = [super init];

    if (self) {

        self.dictionary = jsonDic;
    }
    return self;

}


-(NSString *)imageID {
    return _dictionary[@"id"];
}

-(NSString *)userName {
    NSDictionary *user = _dictionary[@"user"];
    return [user objectForKey:@"username"];
}

-(NSString *)userFullName {
    NSDictionary *user = _dictionary[@"user"];
    return [user objectForKey:@"full_name"];
}

-(NSString *)userProfilePictureURL {
    NSDictionary *user = _dictionary[@"user"];
    return [user objectForKey:@"profile_picture"];
}

-(NSString *)imageThumbnailURL {
    NSDictionary *images = _dictionary[@"images"];
    NSDictionary *type = [images objectForKey:@"thumbnail"];
    return [type objectForKey:@"url"];
}

-(NSString *)imageLowResURL {
    NSDictionary *images = _dictionary[@"images"];
    NSDictionary *type = [images objectForKey:@"low_resolution"];
    return [type objectForKey:@"url"];
}

-(NSString *)imageStdResURL {
    NSDictionary *images = _dictionary[@"images"];
    NSDictionary *type = [images objectForKey:@"standard_resolution"];
    return [type objectForKey:@"url"];
}

@end
