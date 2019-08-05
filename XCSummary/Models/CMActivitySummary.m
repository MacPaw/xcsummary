//
//  CMActivitySummary.m
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMActivitySummary.h"
#import "NSArrayAdditions.h"

@implementation CMActivitySummary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        NSString *uuidString = dictionary[@"UUID"];
        NSArray *subActivitesInfo = dictionary[@"SubActivities"];
        NSArray *attachmetnsInfo = dictionary[@"Attachments"];
        _title = dictionary[@"Title"];
        _uuid = [[NSUUID alloc] initWithUUIDString:uuidString];
        _startTimeInterval = [dictionary[@"StartTimeInterval"] doubleValue];
        _finishTimeInterval = [dictionary[@"FinishTimeInterval"] doubleValue];
        _hasElementsOfInterest = [dictionary[@"HasElementsOfInterest"] boolValue];
        _subActivities = [subActivitesInfo map:^id(NSDictionary *activityInfo, NSUInteger index, BOOL *stop) {
            return [[CMActivitySummary alloc] initWithDictionary:activityInfo];
        }];
        _attachments = [attachmetnsInfo map:^id(NSDictionary *attachmetnsInfo, NSUInteger index, BOOL *stop) {
            return [[CMAttachment alloc] initWithDictionary:attachmetnsInfo];
        }];
    }
    return self;
}

@end
