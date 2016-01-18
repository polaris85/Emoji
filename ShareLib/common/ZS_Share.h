//
//  ZS_Share.h
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import <Foundation/Foundation.h>

#import "ZS_ShareCommon.h"
#import "ZS_ShareResult.h"


@interface ZS_Share : NSObject
{
    BOOL  calledFlag;
}

@property (nonatomic, strong) ZS_ShareResult * shResult;  //copy

@property (nonatomic, strong) ZS_ShareContent * shContent;


-(ZS_ShareResult *) shareContent:(ZS_ShareContent *) shareContent
                     withShareBy:(Class) shareBy
               withShareDelegate:(id<ZS_ShareDelegate>) shareDelegate;

@end





