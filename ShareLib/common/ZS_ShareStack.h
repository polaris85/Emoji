//
//  ZS_ShareProxy.h
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import <Foundation/Foundation.h>


@class ZS_ShareBy;


@interface ZS_ShareStack : NSObject
{
    
}

@property (nonatomic, retain, readonly) NSMutableDictionary * shareGroup;

+(ZS_ShareStack *) sSharedStack;


-(void)addShareBy:(ZS_ShareBy *) shareby;
-(void)removeShareBy:(ZS_ShareBy *) shareby;

-(ZS_ShareBy *) getShareByForHashKey:(NSString *) hashKey;

@end


