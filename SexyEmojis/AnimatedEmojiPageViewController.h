//
//  AnimatedEmojiPageViewController.h
//  SexyEmojis
//
//  Created by Adam on 5/2/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import "ViewController.h"
#import "OBShapedButton.h"
#import <AVFoundation/AVFoundation.h>

@interface AnimatedEmojiPageViewController : ViewController<UICollectionViewDelegate>

@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide1;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide2;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide3;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide4;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide5;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide6;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide7;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide8;
@property (nonatomic, retain) IBOutlet OBShapedButton *imageSlide9;

@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UICollectionView *emojiCollectionView;
@property (nonatomic, retain) IBOutlet UILabel *categoryName;
@property (nonatomic, strong) AVAudioPlayer *theAudio;
@property (nonatomic, retain) IBOutlet UIImageView *bottomBar;

@property (nonatomic, retain) NSMutableArray *emojiList;
@property (nonatomic, retain) NSMutableArray *selectedEmojiList;

@property (nonatomic, assign) int emojiCategory;

-(IBAction)copyEmojis:(id)sender;
-(IBAction)openSMS:(id)sender;
-(IBAction)sharing:(id)sender;

-(IBAction)back:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)splitScreen:(UIButton *)sender;
@end
