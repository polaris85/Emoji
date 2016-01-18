//
//  EmojiPage1ViewController.m
//  SexyEmojis
//
//  Created by Adam on 5/7/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import "EmojiPage1ViewController.h"

@interface EmojiPage1ViewController ()

@end

@implementation EmojiPage1ViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)back:(id)sender;
{
    [self.navigationController popViewControllerAnimated:NO];
}
@end
