//
//  ZS_ShareBy.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import "ZS_ShareBy.h"
#import "NSObject+Hash.h"

@implementation ZS_ShareBy

@synthesize shContent = _shContent;
@synthesize shResult = _shResult;

@synthesize shareDelegate = _shareDelegate;

-(void) dealloc
{
    self.shContent = nil;
    self.shResult = nil;
    
    self.shareDelegate = nil;
    
    [super dealloc];
}

-(ZS_ShareResult *) shareWithContent:(ZS_ShareContent *) content
{
    self.shContent = content;
    self.shResult = [[[ZS_ShareResult alloc] init] autorelease];
    return _shResult;
}
-(id) initWithShareDelegate:(id<ZS_ShareDelegate>) shareDelegate
{
    self = [super init];
    if (self)
    {
        _shareDelegate = shareDelegate;
    }
    return self;
}

+ (NSString *) getLocalizedStringForKey:(NSString *) keyString
{
    return NSLocalizedStringFromTable(keyString, @"lshare", nil);
}

@end

