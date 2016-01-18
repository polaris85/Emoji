//
//  ZS_ShareBySinaWeibo.m
//  weibo
//
//  Created by zs on 13-9-6.
//
//


#import "ZS_ShareBySinaWeibo.h"

//#import "SinaWeibo.h"

//new sina weibo
#define kAppKey             @"3248787614"
#define kAppSecret          @"286b212f1d4e71b5fead9da35edc639a"
#define kAppRedirectURI     @"http://login.zhongsou.com"



#define kSinaWeiboAppKey             @"2330639301"
#define kSinaWeiboAppSecret          @"b40da38bc76d70a2ffcd1f4f7a754390"
#define kSinaWeiboAppRedirectURI     @"http://weibo.com/u/3195606297"

#define kTencentWeiboAppKey             @"801291903"
#define kTencentWeiboAppSecret          @"0cba6f47ac642efc970877d03b2b1891"
#define kTencentWeiboAppRedirectURI     @"https://itunes.apple.com/cn/app/zhong-guo-ying-lou/id541608192?mt=8"

#define kDoubanBroadAppKey             @"0077a5c719af2a470166f1554d0d7ed5"
#define kDoubanBroadAppSecret          @"e624d4fab3356f0a"
#define kDoubanBroadAppRedirectURI     @"http://www.qq.com"

#define kRenrenBroadAPPID             @"223954"
#define kRenrenBroadAppKey             @"bdc9de15d9084d3c81bfbcac2bb56425"
#define kRenrenBroadAppSecret          @"adc75e9663a64df292fbe75369b8167e"
#define kRenrenBroadAppRedirectURI     @"http://widget.renren.com/callback.html"



@implementation ZS_ShareBySinaWeibo

//-(ZS_ShareResult *) shareWithContent:(ZS_ShareContent *) content
//{
//    [super shareWithContent:content];
//    
//    SinaWeibo * sinaWeibo = nil;
//    sinaWeibo = [[SinaWeibo alloc] initWithAppKey:kAppKey
//                                        appSecret:kAppSecret
//                                   appRedirectURI:kAppRedirectURI
//                                      andDelegate:self];
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary *sinaWeiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
//    if ([sinaWeiboInfo objectForKey:@"AccessTokenKey"]
//        && [sinaWeiboInfo objectForKey:@"ExpirationDateKey"]
//        && [sinaWeiboInfo objectForKey:@"UserIDKey"])
//    {
//        sinaWeibo.accessToken = [sinaWeiboInfo objectForKey:@"AccessTokenKey"];
//        sinaWeibo.expirationDate = [sinaWeiboInfo objectForKey:@"ExpirationDateKey"];
//        sinaWeibo.userID = [sinaWeiboInfo objectForKey:@"UserIDKey"];
//    }
//    
//    NSString * ketStri = nil;
//    
//    if ([sinaWeibo isLoggedIn]
//        && ![sinaWeibo isAuthorizeExpired])
//    {
//        //已经登录执行
//        ketStri = @"显示 微博分享页面";
//        [self.shareDelegate shareBy:self withRootOject:sinaWeibo];
//    }
//    else
//    {
//        [sinaWeibo logIn];
//    }
//}

//- (void)pushShareViewController
//{
//    if (!shareViewController)
//    {
//        shareViewController = [[ZS_ShareWeiboViewController alloc] init];
//    }
//    
//    [shareViewController setSocialShareContent:shareContent];
//    NSAssert(self.viewController,@"分享--controller为空");
//    ZS_NavigationController *nvc = [[ZS_NavigationController alloc] initWithRootViewController:shareViewController];
//    [nvc setNavigationBarHidden:YES];
//    [self.viewController presentModalViewController:nvc animated:YES];
//    [nvc release];
//}

//@protocol SinaWeiboDelegate <NSObject>
//@optional
//- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
//{
//    
//}
//- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
//{
//    
//}
//- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
//{
//    
//}
//- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
//{
//    
//}
//- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error
//{
//    
//}

//@protocol SinaWeiboRequestDelegate <NSObject>
//@optional
//- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response;
//- (void)request:(SinaWeiboRequest *)request didReceiveRawData:(NSData *)data;
//- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error;
//- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result;

//@protocol SinaWeiboAuthorizeViewDelegate <NSObject>
//- (void)authorizeView:(SinaWeiboAuthorizeView *)authView
//didRecieveAuthorizationCode:(NSString *)code;
//- (void)authorizeView:(SinaWeiboAuthorizeView *)authView
// didFailWithErrorInfo:(NSDictionary *)errorInfo;
//- (void)authorizeViewDidCancel:(SinaWeiboAuthorizeView *)authView;


@end



