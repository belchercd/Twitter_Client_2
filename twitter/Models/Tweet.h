//
//  Tweet.h
//  twitter
//
//  Created by belchercd on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSObject

// MARK: Properties to configure the view of basic tweets
@property (nonatomic, strong) NSString *idStr; // For favoriting, retweeting & replying
@property (strong, nonatomic) NSString *text; // Text content of tweet
@property (nonatomic) int favoriteCount; // Update favorite count label
@property (nonatomic) BOOL favorited; // Configure favorite button
@property (nonatomic) int retweetCount; // Update favorite count label
@property (nonatomic) BOOL retweeted; // Configure retweet button
@property (strong, nonatomic) User *user; // Contains name, screenname, etc. of tweet author
@property (strong, nonatomic) NSString *createdAtString; // Display date
@property (strong, nonatomic) Tweet *tweet;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;



// For Retweets
@property (strong, nonatomic) User *retweetedByUser;  // user who retweeted if tweet is retweet

//declaring a method from my .m, so it can be used in other files
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;
@end


NS_ASSUME_NONNULL_END