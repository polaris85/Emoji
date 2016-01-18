//
//  AnimatedEmojiPageViewController.m
//  SexyEmojis
//
//  Created by Adam on 5/2/14.
//  Copyright (c) 2014 XZH. All rights reserved.
//

#import "AnimatedEmojiPageViewController.h"
#import "ShareViewController.h"
#import "EmojiCell.h"
#import "UIControl+Sound.h"

@interface AnimatedEmojiPageViewController (){
    CGPoint pointArray[8];
    NSMutableDictionary *imageSlideArray[8];
    NSUInteger count;
    
    NSMutableDictionary *imageDictionary1;
    NSMutableDictionary *imageDictionary2;
    NSMutableDictionary *imageDictionary3;
    NSMutableDictionary *imageDictionary4;
    NSMutableDictionary *imageDictionary5;
    NSMutableDictionary *imageDictionary6;
    NSMutableDictionary *imageDictionary7;
    NSMutableDictionary *imageDictionary8;
}

@end

@implementation AnimatedEmojiPageViewController

@synthesize imageSlide1;
@synthesize imageSlide2;
@synthesize imageSlide3;
@synthesize imageSlide4;
@synthesize imageSlide5;
@synthesize imageSlide6;
@synthesize imageSlide7;
@synthesize imageSlide8;
@synthesize imageSlide9;

@synthesize theAudio;
@synthesize emojiList;
@synthesize emojiCollectionView;
@synthesize selectedEmojiList;
@synthesize bottomBar;

@synthesize emojiCategory;
@synthesize categoryName;
@synthesize backButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
//    NSMutableDictionary *dic = imageSlideArray[0];
//    UIButton *imageButton = (UIButton *)[dic objectForKey:@"imageView"];
//    
//    CGPoint newCurrentlyCenter = [[dic objectForKey:@"position"] CGPointValue];
//    
//    imageButton.center = newCurrentlyCenter;
    [bottomBar setHidden:NO];
}
- (void)viewDidLoad
{
    
    pointArray[0] = CGPointMake(imageSlide1.center.x, imageSlide1.center.y);
    pointArray[1] = CGPointMake(imageSlide2.center.x, imageSlide2.center.y);
    pointArray[2] = CGPointMake(imageSlide3.center.x, imageSlide3.center.y);
    pointArray[3] = CGPointMake(imageSlide4.center.x, imageSlide4.center.y);
    pointArray[4] = CGPointMake(imageSlide5.center.x, imageSlide5.center.y);
    pointArray[5] = CGPointMake(imageSlide6.center.x, imageSlide6.center.y);
    pointArray[6] = CGPointMake(imageSlide7.center.x, imageSlide7.center.y);
    pointArray[7] = CGPointMake(imageSlide8.center.x, imageSlide8.center.y);
    
    imageDictionary1 = [[NSMutableDictionary alloc] init];
    [imageDictionary1 setValue:imageSlide1 forKey:@"imageView"];
    [imageDictionary1 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide1.center.x+200, imageSlide1.center.y-200)] forKey:@"position"];

    imageDictionary2 = [[NSMutableDictionary alloc] init];
    [imageDictionary2 setValue:imageSlide2 forKey:@"imageView"];
    [imageDictionary2 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide2.center.x+400, imageSlide2.center.y+400)] forKey:@"position"];
    
    imageDictionary3 = [[NSMutableDictionary alloc] init];
    [imageDictionary3 setValue:imageSlide3 forKey:@"imageView"];
    [imageDictionary3 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide3.center.x, imageSlide3.center.y-500)] forKey:@"position"];
    
    imageDictionary4 = [[NSMutableDictionary alloc] init];
    [imageDictionary4 setValue:imageSlide4 forKey:@"imageView"];
    [imageDictionary4 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide4.center.x-200, imageSlide4.center.y-200)] forKey:@"position"];
    
    imageDictionary5 = [[NSMutableDictionary alloc] init];
    [imageDictionary5 setValue:imageSlide5 forKey:@"imageView"];
    [imageDictionary5 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide5.center.x-200, imageSlide5.center.y)] forKey:@"position"];
    
    imageDictionary6 = [[NSMutableDictionary alloc] init];
    [imageDictionary6 setValue:imageSlide6 forKey:@"imageView"];
    [imageDictionary6 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide6.center.x-200, imageSlide6.center.y+200)] forKey:@"position"];
    
    imageDictionary7 = [[NSMutableDictionary alloc] init];
    [imageDictionary7 setValue:imageSlide7 forKey:@"imageView"];
    [imageDictionary7 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide7.center.x-300, imageSlide7.center.y+300)] forKey:@"position"];
    
    imageDictionary8 = [[NSMutableDictionary alloc] init];
    [imageDictionary8 setValue:imageSlide8 forKey:@"imageView"];
    [imageDictionary8 setValue:[NSValue valueWithCGPoint:CGPointMake(imageSlide8.center.x+200, imageSlide8.center.y+200)] forKey:@"position"];
    
    count = 0;
    
    //[imageSlide1 setSoundNamed:@"sound.aif" forControlEvent:UIControlEventAllTouchEvents];
    //[imageSlide2 setSoundNamed:@"sound.aif" forControlEvent:UIControlEventAllEvents];
    /*
    [imageSlide3 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    [imageSlide4 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    [imageSlide5 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    [imageSlide6 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    [imageSlide7 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    [imageSlide8 setSoundNamed:@"slide-scissors.aif" forControlEvent:UIControlEventAllEvents];
    */
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    emojiCollectionView.allowsMultipleSelection = YES;
 
    [backButton setHidden:YES];
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

-(IBAction)splitScreen:(UIButton *)sender
{
 
    [bottomBar setHidden:YES];
    
    NSString *soundPath =[[NSBundle mainBundle] pathForResource:@"open" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    
    NSError *error = nil;
    self.theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    
    [self.theAudio setVolume:0.02f];
    [self.theAudio play];
    
    [backButton setHidden:NO];
    
    emojiCollectionView.allowsMultipleSelection = YES;
    switch (sender.tag) {
        case 881:
            imageSlideArray[0] = imageDictionary5;
            imageSlideArray[1] = imageDictionary2;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary4;
            imageSlideArray[4] = imageDictionary6;
            imageSlideArray[5] = imageDictionary8;
            imageSlideArray[6] = imageDictionary3;
            imageSlideArray[7] = imageDictionary1;
            
            emojiCategory = 1;
            [categoryName setText:@"JUST SAY IT"];
            break;
        case 882:
            imageSlideArray[0] = imageDictionary8;
            imageSlideArray[1] = imageDictionary1;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary6;
            imageSlideArray[4] = imageDictionary5;
            imageSlideArray[5] = imageDictionary4;
            imageSlideArray[6] = imageDictionary3;
            imageSlideArray[7] = imageDictionary2;
            
            emojiCategory = 2;
            [categoryName setText:@"YOUR PLACE OR MINE"];
            break;
        case 883:
            imageSlideArray[0] = imageDictionary2;
            imageSlideArray[1] = imageDictionary5;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary1;
            imageSlideArray[4] = imageDictionary6;
            imageSlideArray[5] = imageDictionary4;
            imageSlideArray[6] = imageDictionary8;
            imageSlideArray[7] = imageDictionary3;
            
            emojiCategory = 3;
            [categoryName setText:@"SEXY SMILEYS"];
            emojiCollectionView.allowsMultipleSelection = NO;
            break;
        case 884:
            imageSlideArray[0] = imageDictionary6;
            imageSlideArray[1] = imageDictionary2;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary1;
            imageSlideArray[4] = imageDictionary5;
            imageSlideArray[5] = imageDictionary3;
            imageSlideArray[6] = imageDictionary8;
            imageSlideArray[7] = imageDictionary4;
            [categoryName setText:@"ITS FRIDAY NIGHT"];
            emojiCategory = 4;
            break;
        case 885:
            imageSlideArray[0] = imageDictionary1;
            imageSlideArray[1] = imageDictionary2;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary4;
            imageSlideArray[4] = imageDictionary6;
            imageSlideArray[5] = imageDictionary3;
            imageSlideArray[6] = imageDictionary8;
            imageSlideArray[7] = imageDictionary5;
            [categoryName setText:@"SUGARDADDY"];
            emojiCategory = 5;
            break;
        case 886:
            imageSlideArray[0] = imageDictionary5;
            imageSlideArray[1] = imageDictionary2;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary4;
            imageSlideArray[4] = imageDictionary1;
            imageSlideArray[5] = imageDictionary3;
            imageSlideArray[6] = imageDictionary8;
            imageSlideArray[7] = imageDictionary6;
            [categoryName setText:@"KISS ME, TELL ME YOU LOVE ME"];
            emojiCategory = 6;
            break;
        case 887:
            imageSlideArray[0] = imageDictionary6;
            imageSlideArray[1] = imageDictionary5;
            imageSlideArray[2] = imageDictionary1;
            imageSlideArray[3] = imageDictionary3;
            imageSlideArray[4] = imageDictionary4;
            imageSlideArray[5] = imageDictionary8;
            imageSlideArray[6] = imageDictionary2;
            imageSlideArray[7] = imageDictionary7;
            [categoryName setText:@"TICKLE MY TASTE BUDS"];
            emojiCategory = 7;
            break;
        case 888:
            imageSlideArray[0] = imageDictionary5;
            imageSlideArray[1] = imageDictionary2;
            imageSlideArray[2] = imageDictionary7;
            imageSlideArray[3] = imageDictionary1;
            imageSlideArray[4] = imageDictionary6;
            imageSlideArray[5] = imageDictionary4;
            imageSlideArray[6] = imageDictionary3;
            imageSlideArray[7] = imageDictionary8;
            
            emojiCategory = 8;
            
            [self sharing:nil];
            return;
            break;
        
        default:
            break;
    }

    //[NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(animateImageTimer:) userInfo:nil repeats:YES];
     
    [self animateImages];
    
    NSLog(@"Tag=%ld", (long)sender.tag);
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"EmojiList%d", emojiCategory] ofType:@"plist"];
    
    self.emojiList = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    for(NSString *str in self.emojiList)
        NSLog(@"--%@", str);
    
    self.selectedEmojiList = [[NSMutableArray alloc] init];
    
    [emojiCollectionView reloadData];
    
        /*
    CGPoint newCurrentlyCenter = CGPointMake(imageSlide1.center.x+150, imageSlide1.center.y-150);
    CGPoint newCurrentlyCenter1 = CGPointMake(imageSlide2.center.x+200, imageSlide2.center.y+200);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    imageSlide1.center = newCurrentlyCenter;
    imageSlide2.center = newCurrentlyCenter1;
    [UIView commitAnimations];
     */
    
}
-(void) animateImages
{
    
    //[self.theAudio play];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    
    for(int i = 0; i < 8; i++){
        NSMutableDictionary *dic = imageSlideArray[i];
        UIButton *imageButton = (UIButton *)[dic objectForKey:@"imageView"];
    
        CGPoint newCurrentlyCenter = [[dic objectForKey:@"position"] CGPointValue];
    
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        imageButton.center = newCurrentlyCenter;
    }
    
    [UIView commitAnimations];
}
-(void) animateImageTimer:(NSTimer *)timer;
{
    
    //[self.theAudio play];
    
    NSMutableDictionary *dic = imageSlideArray[count];
    UIButton *imageButton = (UIButton *)[dic objectForKey:@"imageView"];
    
    CGPoint newCurrentlyCenter = [[dic objectForKey:@"position"] CGPointValue];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    imageButton.center = newCurrentlyCenter;
  
    [UIView commitAnimations];
    
    
    count++;
//     imageButton.hidden = YES;
    if (count == 8) {
        [timer invalidate];
        count = 0;
    }
}
-(IBAction)copyEmojis:(id)sender
{
    
    //[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateImageTimer:) userInfo:nil repeats:YES];
    /*NSMutableArray *imageList = [[NSMutableArray alloc] init];
    
    for (NSString *emojiCode in selectedEmojiList) {
        NSString *imageName = [NSString stringWithFormat:@"%@.png",emojiCode];
        [imageList addObject:[UIImage imageNamed:imageName]];
    }
    [[UIPasteboard generalPasteboard] setImages:imageList];
     */
    /*
    UIImage *emoji = [UIImage imageNamed:@"e001"];
    [[UIPasteboard generalPasteboard] setImage:emoji];
    */
    
    
    NSLog(@"Copy Button Clicked");
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];

    if(emojiCategory == 3){
        for (NSString *imageName in selectedEmojiList) {
            
            NSString *gifPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:imageName];
            NSData *gifData = [[NSData alloc] initWithContentsOfFile:gifPath];
            [pasteboard setData:gifData forPasteboardType:@"com.compuserve.gif"];
        }
    }else{
        NSMutableArray *imageList = [[NSMutableArray alloc] init];
        for (NSString *imageName in selectedEmojiList) {
            [imageList addObject:[UIImage imageNamed:imageName]];
        }
        [[UIPasteboard generalPasteboard] setImages:imageList];    }
   
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"test=%lu", (unsigned long)[self.emojiList count]);
    return [self.emojiList count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (EmojiCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"EmojiCell";
    
    EmojiCell *cell = (EmojiCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if(cell.selected == YES){
        [cell.contentView.layer setBorderColor:[UIColor redColor].CGColor];
        [cell.contentView.layer setBorderWidth:3.0f];
    }else{
        cell.contentView.backgroundColor = nil;
        [cell.contentView.layer setBorderColor:[UIColor clearColor].CGColor];
        [cell.contentView.layer setBorderWidth:3.0f];
    }
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:8890];
    
    //NSLog(@"%@", [self.photoList objectAtIndex:indexPath.row]);
    
    NSString *imageName = [self.emojiList objectAtIndex:indexPath.row];
    
    NSLog(@"%@", imageName);
    
    imageView.image = [UIImage imageNamed:imageName];
    //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EmojiCell *cell = (EmojiCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    //NSLog(@"%@", [self.photoList objectAtIndex:indexPath.row]);
    NSString *selectedEmoji = [self.emojiList objectAtIndex:indexPath.row];
    [self.selectedEmojiList addObject:selectedEmoji];
    
    [cell.contentView.layer setBorderColor:[UIColor redColor].CGColor];
    [cell.contentView.layer setBorderWidth:3.0f];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *deSelectedEmoji = [self.emojiList objectAtIndex:indexPath.row];
    [self.selectedEmojiList removeObject:deSelectedEmoji];
    
    EmojiCell *cell = (EmojiCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
    [cell.contentView.layer setBorderColor:[UIColor clearColor].CGColor];
    [cell.contentView.layer setBorderWidth:3.0f];
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    if (emojiCategory == 3) {
        if ([self.selectedEmojiList count] < 1)
            return true;
        else
            return false;
    }else
     */
        return true;
}

-(IBAction)back:(id)sender;
{
    //[self.navigationController popViewControllerAnimated:YES];
    NSString *soundPath =[[NSBundle mainBundle] pathForResource:@"close" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    
    NSError *error = nil;
    self.theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    [self.theAudio setVolume:0.02f];
    [self.theAudio play];
    
    [backButton setHidden:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    imageSlide1.center = pointArray[0];
    imageSlide2.center = pointArray[1];
    imageSlide3.center = pointArray[2];
    imageSlide4.center = pointArray[3];
    imageSlide5.center = pointArray[4];
    imageSlide6.center = pointArray[5];
    imageSlide7.center = pointArray[6];
    imageSlide8.center = pointArray[7];
    
    [UIView commitAnimations];
    
    [bottomBar setHidden:NO];
    
}
-(IBAction)sharing:(UIButton *)sender
{
    UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    ShareViewController *shareViewController = (ShareViewController *)[mainstoryboard instantiateViewControllerWithIdentifier:@"ShareViewController"];
    [self.navigationController pushViewController:shareViewController animated:YES];

}
-(IBAction)openSMS:(UIButton *)sender
{
    //[self.navigationController popViewControllerAnimated:YES];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms:"]];
    
}
-(IBAction)reset:(id)sender;
{
    [self.selectedEmojiList removeAllObjects];
    [self.emojiCollectionView reloadData];
}
@end
