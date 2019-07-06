//
//  ComposeViewController.m
//  twitter
//
//  Created by belchercd on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)tweetButton:(UIBarButtonItem *)sender {
    
    
    [[APIManager shared]postStatusWithText:_composeView.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
    }];
}

- (IBAction)closeButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
