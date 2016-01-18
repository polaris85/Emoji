//
//  ZS_ShareBy.h
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import <Foundation/Foundation.h>

#import "ZS_ShareCommon.h"
#import "NSObject+Hash.h"


@class ZS_ShareResult;
@class ZS_ShareBy;


@interface ZS_ShareBy : NSObject

@property (nonatomic, strong) ZS_ShareContent * shContent;  //copy
@property (nonatomic, strong) ZS_ShareResult * shResult;
@property (nonatomic, assign) id<ZS_ShareDelegate> shareDelegate;


-(id) initWithShareDelegate:(id<ZS_ShareDelegate>) shareDelegate;
-(ZS_ShareResult *) shareWithContent:(ZS_ShareContent *) content;


+ (NSString *) getLocalizedStringForKey:(NSString *) keyString;


@end


