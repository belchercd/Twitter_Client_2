//
//  ComposeViewController.h
//  twitter
//
//  Created by belchercd on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate
- (void)didTweet:(Tweet *)tweet;
@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *composeView;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

- (IBAction)tweetButton:(UIBarButtonItem *)sender;
- (IBAction)closeButton:(UIBarButtonItem *)sender;

@end






NS_ASSUME_NONNULL_END
