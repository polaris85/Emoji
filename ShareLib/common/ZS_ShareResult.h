//
//  ZS_ShareResult.h
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import <Foundation/Foundation.h>

#import "ZS_ShareCommon.h"


@class ZS_ShareBy;
@class ZS_ShareResult;

@protocol ZS_ShareDelegate <NSObject>

@required
-(void) shareBy:(ZS_ShareBy *) shareBy withResult:(ZS_ShareResult *) result;
   
-(void) shareBy:(ZS_ShareBy *)shareBy withRootOject:(id) shObject;

@end

//////////////////////////////////////////////////////////////////////

//分享返回 结果信息  

@interface ZS_ShareResult : NSObject


@property (nonatomic, assign) BOOL shState;  //只有成功 与 失败
@property (nonatomic, strong) id shRetInfo;
@property (nonatomic, strong) NSString * shareByHashString;


-(id) initWithReturnInfo:(NSDictionary *) returnInfo;

@end

//////////////////////////////////////////////////////////////////////





