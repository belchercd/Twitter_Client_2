//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UIImageView+AFNetworking.h"


@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

//added the property. how to set to an array??
//@property (nonatomic, strong) NSArray<Tweet *> *tweets;
@property (nonatomic, strong) NSMutableArray *tweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) UIViewController *loginViewController;
@property (nonatomic, strong) NSString *text;

- (instancetype)postStatusWithText:(NSString *)text;

//:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion




@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize a UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
//    binds the action to the UIRefreshControl
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
//    adds UIRefreshControl to the tableview
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    //declaring fetch tweets method
    [self fetchTweets];
    [self.refreshControl beginRefreshing];

    self.tableView.rowHeight = 140;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)fetchTweets
{
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = (NSMutableArray *)tweets;
            [self.tableView reloadData];
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            //            for (NSDictionary *dictionary in tweets) {
            //                NSString *text = dictionary[@"text"];
            //                NSLog(@"%@", text);
            //            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
        // Tell the refreshControl to stop spinning
        [self.refreshControl endRefreshing];
    }];
}


- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    //declaring fetchTweets method
    [self fetchTweets];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

}
*/

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweet *tweet = self.tweets[indexPath.row];
    
    cell.tweet = tweet;
    cell.nameLabel.text = tweet.user.name;
    cell.usernameLabel.text = tweet.user.screenName;
    cell.dateLabel.text = tweet.createdAtString;
    cell.retweetLabel.text = tweet.idStr;
    cell.likeLabel.text = tweet.idStr;
    cell.tweetView.text = tweet.text;
    NSURL *profilePictureURL = [NSURL URLWithString:tweet.user.profileView];
    [cell.profileView setImageWithURL: profilePictureURL];
   
    
    //comeback to buttons
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (IBAction)composeButton:(UIBarButtonItem *)sender {
    
}

- (IBAction)logoutButton:(UIBarButtonItem *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

// protocol method
- (void)didTweet:(Tweet *)tweet {
    NSLog(@"tweet posted");
}
@end
