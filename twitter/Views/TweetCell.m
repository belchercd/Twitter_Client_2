//
//  TweetCell.m
//  twitter
//
//  Created by belchercd on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
#import "Tweet.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)didTapFavorite:(id)sender {
    self.tweet.favorited = !(self.tweet.favorited);
    if(self.tweet.favorited){
        self.tweet.favoriteCount += 1;
        [self.likeButton setImage: [UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    //unfavorited so grey
    else{
        self.tweet.favoriteCount -= 1;
        [self.likeButton setImage: [UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
        
    }
}

- (IBAction)didTapRetweet:(id)sender {
    self.tweet.retweeted = !(self.tweet.retweeted);
    if(self.tweet.retweeted){
        self.tweet.retweetCount += 1;
        //when retweet is pressed
        [self.retweetButton setImage: [UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];

    }
    else{
        self.tweet.retweetCount -= 1;
        [self.retweetButton setImage: [UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully untweeted the following Tweet: %@", tweet.text);
            }
        }];

    }

}



@end


