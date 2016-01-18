//
//  ZS_Share.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import "ZS_Share.h"

#import "ZS_ShareByMail.h"
#import "ZS_ShareByMessage.h"

@interface ZS_Share() 
@end

@implementation ZS_Share

@synthesize shContent = _shContent;

@synthesize shResult = _shResult;


-(void) dealloc
{
    self.shContent = nil;
    self.shResult = nil;
    
    [super dealloc];
}

-(id) init
{
    self = [super init];
    if (self)
    {
        calledFlag = NO;
    }
    return self;
}

-(ZS_ShareResult *) shareContent:(ZS_ShareContent *) shareContent
                     withShareBy:(Class) shareBy
               withShareDelegate:(id<ZS_ShareDelegate>) shareDelegate
{
    @synchronized(self)
    {
        if ([shareBy isSubclassOfClass:[ZS_ShareBy class]]
            && !calledFlag)
        {
            calledFlag = YES;
            ZS_ShareBy * share = nil;
            self.shContent = shareContent;
            
            share = [[[shareBy alloc] init] autorelease];
            share.shareDelegate = shareDelegate;
            [[ZS_ShareStack sSharedStack] addShareBy:share];
            self.shResult = [share shareWithContent:shareContent];
            return _shResult;
        }else
            if (calledFlag)
            {
                self.shResult = [[[ZS_ShareResult alloc] init] autorelease];
                _shResult.shRetInfo = [ZS_ShareBy getLocalizedStringForKey:@"ZS_ShareResult_CalledMultiTime_Info"];
                _shResult.shState = NO;
            }else
            {
                self.shResult = [[[ZS_ShareResult alloc] init] autorelease];
                _shResult.shState = NO;
            }
        return _shResult;
    }
}

@end



