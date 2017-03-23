//
//  CMTest.m
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMTest.h"
#import "NSArrayAdditions.h"
#import "CMActivitySummary.h"

CMTestStatus CMTestStatusFromString(NSString * string);

@implementation CMTest

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        NSArray *rawTests = dictionary[@"Subtests"];
        NSString *status = dictionary[@"TestStatus"];
        NSArray *activities = dictionary[@"ActivitySummaries"];
        NSString *summaryGUIDString = dictionary[@"TestSummaryGUID"];
        _testName = dictionary[@"TestName"];
        _testIdentifier = dictionary[@"TestIdentifier"];
        _testObjectClass = dictionary[@"TestObjectClass"];
        _duration = [dictionary[@"Duration"] doubleValue];
        _subTests = [rawTests map:^id(NSDictionary *rawTest, NSUInteger index, BOOL *stop) {
            return [[CMTest alloc] initWithDictionary:rawTest];
        }];
        _activities = [activities map:^id(NSDictionary *rawActivity, NSUInteger index, BOOL *stop) {
            return [[CMActivitySummary alloc] initWithDictionary:rawActivity];
        }];
        _status = CMTestStatusFromString(status);
        _testSummaryGUID = [[NSUUID alloc] initWithUUIDString:summaryGUIDString];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n%@ %@ %@\n", [super description], self.testName, self.subTests];
}

@end

CMTestStatus CMTestStatusFromString(NSString * string)
{
    CMTestStatus status = CMTestStatusUnknown;
    if ([string isEqualToString:@"Failure"])
    {
        status = CMTestStatusFailure;
    }
    else if ([string isEqualToString:@"Success"])
    {
        status = CMTestStatusSuccess;
    }
    return status;
}
