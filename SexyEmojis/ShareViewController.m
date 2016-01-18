//
//  ShareViewController.m
//  SexyEmojis
//
//  Created by Adam on 5/8/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import "ShareViewController.h"
#import "ZS_Share.h"
#import <Social/Social.h>
#import "SSH.h"
#import "SSHConfig.h"
#import "SSHWebViewController.h"
#import "SSHEmailViewController.h"
#import "NSString+URLEscape.h"
@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    //return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShareCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1201];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1202];
    if(indexPath.row == 0){
        [imageView setImage:[UIImage imageNamed:@"share_sms.png"]];
        [label setText: @"Share By SMS"];
    }else if(indexPath.row == 1){
        [imageView setImage:[UIImage imageNamed:@"share_email.png"]];
        [label setText: @"Share By Email"];
    }else if(indexPath.row == 2){
        [imageView setImage:[UIImage imageNamed:@"share_facebook.png"]];
        [label setText: @"Share By Facebook"];
    }else if(indexPath.row == 3){
        [imageView setImage:[UIImage imageNamed:@"share_twitter.png"]];
        [label setText: @"Share By Twitter"];
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZS_Share  *share = [[ZS_Share alloc] init] ;
    if(indexPath.row == 0){
        ZS_ShareResult * result = [share shareContent:nil withShareBy:NSClassFromString(@"ZS_ShareByMessage") withShareDelegate:self];
    }else if(indexPath.row == 1){
        ZS_ShareResult * result = [share shareContent:nil withShareBy:NSClassFromString(@"ZS_ShareByMail") withShareDelegate:self];
    }else if(indexPath.row == 2){
        [self postToFacebook:nil];
    }else if(indexPath.row == 3){
        [self postToTwitter:nil];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void) shareBy:(ZS_ShareBy *) shareBy withResult:(ZS_ShareResult *) result
{
    NSLog(@"%@", result.shRetInfo);
    
    NSDictionary * dic = (NSDictionary *) result.shRetInfo;
    
    for (NSString * key in [dic allKeys])
    {
        NSLog(@"%@", [dic  objectForKey:key]);
        
    }
    [shareController dismissViewControllerAnimated:YES completion:^{
        
        //        [self performSelector:@selector(circleTest) withObject:nil afterDelay:1];
     
        shareController = nil;
        
    }];
}

-(void) shareBy:(ZS_ShareBy *)shareBy withRootOject:(id)controller
{
    shareController = controller;
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}

-(IBAction)back:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)postToFacebook:(id)sender;
{
    
    //[self.navigationController popViewControllerAnimated:YES];
    //if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [composeController setInitialText:@"Hey! You have to download this amazing app - Sexy Emojis.  Now we can text \"Whats really on our minds\"--"];
        
        [composeController addURL: [NSURL URLWithString:@"http://www.itune.com"]];
    
        [composeController addImage:[UIImage imageNamed:@"AppIcon76x76.png"]];
    
        [self presentViewController:composeController animated:YES completion:nil];
    //}
    /*
    NSString *urlString = [NSString stringWithFormat:@"http://www.facebook.com/dialog/feed?app_id=%@&redirect_uri=http://facebook.com/?sk=lf&description=%@&link=%@&display=touch", FACEBOOK_APP_ID, [FACEBOOK_DESCRIPTION urlEscape], [FACEBOOK_LINK urlEscape]];
    
    NSLog(@"%@", urlString);
    [self showWebView:@"Share on Facebook" withUrl:[NSURL URLWithString:urlString]];
     */
}
-(IBAction)postToTwitter:(id)sender;
{
    
    //if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    //{
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Hey! You have to download this amazing app - Sexy Emojis.  Now we can text \"Whats really on our minds\"--"];
    
        [tweetSheet addURL:[NSURL URLWithString:@"http://www.itune.com"]];
    
        [tweetSheet addImage:[UIImage imageNamed:@"AppIcon76x76.png"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    //}
    
    /*
    NSString *urlString = [NSString stringWithFormat:@"http://twitter.com/share?text=%@", [TWITTER_TEXT urlEscape]];
    [self showWebView:@"Share on Twitter" withUrl:[NSURL URLWithString:urlString]];
     */
}

- (void)showWebView:(NSString *)aTitle withUrl:(NSURL *)aUrl {
    
    SSHWebViewController *webController = [[SSHWebViewController alloc] init];
    [webController setTitle:aTitle];
    [webController requestURL:aUrl];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:webController];
	[self presentModalViewController:navController animated:YES];

}
@end
