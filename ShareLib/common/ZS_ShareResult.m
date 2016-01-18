//
//  ZS_ShareResult.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import "ZS_ShareResult.h"

#import "ZS_ShareBy.h"



//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
@implementation ZS_ShareResult

@synthesize shRetInfo = _shRetInfo;
@synthesize shState = _shState;

@synthesize shareByHashString = _shareByHashString;

-(void) dealloc
{
    self.shRetInfo = nil;
    self.shareByHashString = nil;
    
    [super dealloc];
}
-(id) init
{
    self = [super init];
    if (self)
    {
        self.shRetInfo = [ZS_ShareBy getLocalizedStringForKey:@"ZS_ShareResult_TypeUndefined_Info"];
        self.shState = YES;
        self.shareByHashString = @"";
    }
    return self;
}
-(id) initWithReturnInfo:(NSDictionary *) returnInfo
{
    self = [self init];
    if (self)
    {
    }
    return self;
}

@end



