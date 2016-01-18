//
//  ZS_ShareProxy.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NSObject+Hash.h"
#import "ZS_ShareStack.h"
#import "ZS_ShareBy.h"


static ZS_ShareStack * sSharedStack = nil;


@interface ZS_ShareStack() 
@property (nonatomic, retain) NSMutableDictionary * shareGroup;
@end


@implementation ZS_ShareStack

@synthesize shareGroup = _shareGroup;


-(void) dealloc
{
    self.shareGroup = nil;
    [super dealloc];
}
-(id) init
{
    self = [super init];
    if (self)
    {
        _shareGroup = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    return self;
}
+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (sSharedStack == nil)
        {
            sSharedStack = [super allocWithZone:zone];
            return sSharedStack;
        }
    }
    return nil;
}
- (id)retain
{
    return sSharedStack;
}

- (oneway void)release
{
    return;
}

+(ZS_ShareStack *) sSharedStack
{
    @synchronized(self)
    {
        if (sSharedStack == nil)
        {
            sSharedStack = [[[self class] alloc] init];
        }
    }
    
    return sSharedStack;
}

////////////////////////////////////////////////////

-(void)addShareBy:(ZS_ShareBy *) shareby
{
    @synchronized(self)
    {
        NSString * hasstr = [self getHashString:shareby];
        [self.shareGroup setObject:shareby
                            forKey: hasstr];
    }
}
-(void)removeShareBy:(ZS_ShareBy *) shareby
{
    @synchronized(self)
    {
        NSString * hasstr = [self getHashString:shareby];
        [self.shareGroup removeObjectForKey:hasstr];
    }
}
-(ZS_ShareBy *) getShareByForHashKey:(NSString *) hashKey
{
    ZS_ShareBy * shareBy =  nil;
    @synchronized(self)
    {
        shareBy = [self.shareGroup objectForKey:hashKey];
    }
    return shareBy;
}

@end

////////////////////////////////////////////////////







