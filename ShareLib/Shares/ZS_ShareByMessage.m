//
//  ZS_ShareByMessage.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import "ZS_ShareByMessage.h"


@implementation ZS_ShareByMessage

-(ZS_ShareResult *) shareWithContent:(ZS_ShareContent *) pars
{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    NSString * infoKey = nil;
    if (messageClass != nil)
    {
        if ([messageClass canSendText])
        {
            [self displaySMSComposerSheet];
            infoKey = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Device_OK"];
        }
        else
        {
            infoKey = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Device_Unable"];
        }
    }else
    {
        infoKey = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_System_Failed"];
    }
    return [self getReturnInfo:infoKey];
}


-(ZS_ShareResult *) getReturnInfo:(NSString *) keyStr
{
    NSMutableDictionary * dicinfo = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSString * mtitle = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageTitle"];
    
    NSString * titlekey = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_AlertTitleKey"];
    NSString * messagekey = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_AlertMessageKey"];
    [dicinfo setObject: mtitle forKey: titlekey];
    [dicinfo setObject:keyStr forKey: messagekey];
    
    ZS_ShareResult * shresult = self.shResult;
    shresult.shRetInfo = dicinfo;
    
    NSString * mok = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Device_OK"];
    NSString * msok = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Send_OK"];
    if ([keyStr isEqualToString: mok]
        || [keyStr isEqualToString: msok])
    {
        shresult.shState = YES;;
    }else
    {
        shresult.shState = false;
    }
    shresult.shareByHashString = [self getHashString:self];
    
    return shresult;
}


-(void)displaySMSComposerSheet
{
    //NSArray *toRecipients = [NSArray arrayWithObject:@"138-114-44476"];
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate =self;
    NSString *smsBody = nil;
    smsBody = @"Hey! You have to download this amazing app - Sexy Emojis.  Now we can text \"Whats really on our minds\"-- http://www.itune.com";
    picker.body = smsBody;
    [self setServiceInfo:picker];
    
    [self.shareDelegate shareBy:self withRootOject:picker];
    [picker release];
}
-(void) setServiceInfo:(id)serviceInfo
{
    
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result
{
    NSString * keystr = nil;
    switch (result)
    {
        case MessageComposeResultCancelled:
        {
            keystr = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Send_Cancel"];
            break;
        }
        case MessageComposeResultSent:
        {
            keystr = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Send_OK"];
            break;
        }
        case MessageComposeResultFailed:
        {
            keystr = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Send_Failed"];
            break;
        }
        default:
        {
            keystr = [ZS_ShareBy getLocalizedStringForKey:@"ZS_Share_MessageInfo_Send_NotSend"];
            break;
        }
    }
    [self getReturnInfo: keystr];
    [self.shareDelegate shareBy:self withResult:self.shResult];
    [[ZS_ShareStack sSharedStack] removeShareBy:self];
}

@end


