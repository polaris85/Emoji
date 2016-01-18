//
//  ViewController.m
//  SexyEmojis
//
//  Created by Adam on 4/30/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sCategory;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goEmojiPage:(UIButton *)sender
{
    NSString *segueName = @"";
    
    switch (sender.tag) {
        case 881:
            segueName = @"goAnimatedEmojiPage";
            break;
        case 882:
            segueName = @"goEmojiPage2";
            break;
        case 883:
            segueName = @"goEmojiPage3";
            break;
        case 884:
            segueName = @"goEmojiPage4";
            break;
        case 885:
            segueName = @"goEmojiPage5";
            break;
        case 886:
            segueName = @"goEmojiPage6";
            break;
        default:
            break;
    }
    [self performSegueWithIdentifier:segueName sender:nil];
}
@end
