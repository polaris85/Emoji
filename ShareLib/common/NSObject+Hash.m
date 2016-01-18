//
//  NSObject+Hash.m
//  weibo
//
//  Created by zs on 13-9-5.
//
//

#import "NSObject+Hash.h"


@interface NSObject_Hash : NSObject
@end
@implementation NSObject_Hash
@end



@implementation  NSObject(Hash)

-(NSString *) getHashString:(id) object
{
    NSInteger   hashcode = [object hash];
    NSString * hashstr = [NSString stringWithFormat:@"%i", hashcode];
    return hashstr;
}
@end


