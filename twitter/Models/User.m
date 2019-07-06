//
//  User.m
//  twitter
//
//  Created by belchercd on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User


//defines initWithDictionary method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileView = dictionary[@"profile_image_url_https"];
    }
    return self;
}

@end
