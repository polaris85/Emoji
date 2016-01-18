//
//  ShareViewController.h
//  SexyEmojis
//
//  Created by Adam on 5/8/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController<UITableViewDelegate>
{
UIViewController * shareController;
}
-(IBAction)back:(id)sender;
- (IBAction)postToTwitter:(id)sender;
- (IBAction)postToFacebook:(id)sender;
@end
