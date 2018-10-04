//
//  CMAttachment.m
//  xcsummary
//
//  Created by Volodymyr Borodavchuk on 10/3/18.
//  Copyright © 2018 MacPaw inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMAttachment.h"
#import "NSArrayAdditions.h"

@implementation CMAttachment

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        _filename = dictionary[@"Filename"];
    }
    return self;
}

@end
