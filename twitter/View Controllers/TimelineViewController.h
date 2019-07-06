//
//  TimelineViewController.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"

@interface TimelineViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)composeButton:(UIBarButtonItem *)sender;
- (IBAction)logoutButton:(UIBarButtonItem *)sender;
- (void)postStatusWithText:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion;



@end
