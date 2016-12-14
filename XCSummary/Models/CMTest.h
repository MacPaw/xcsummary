//
//  CMTest.h
//  TestFriend
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMEntity.h"

typedef NS_ENUM(NSInteger, CMTestStatus)
{
    CMTestStatusUnknown = 0,
    CMTestStatusSuccess = 1,
    CMTestStatusFailure = 2
};

@class CMActivitySummary;
@interface CMTest : CMEntity

@property (nonatomic, strong, readonly) NSUUID *testSummaryGUID;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, readonly) CMTestStatus status;
@property (nonatomic, copy, readonly) NSString *testIdentifier;
@property (nonatomic, copy, readonly) NSString *testName;
@property (nonatomic, copy, readonly) NSString *testObjectClass;

@property (nonatomic, strong, readonly) NSArray <CMTest *> *subTests;
@property (nonatomic, strong, readonly) NSArray <CMActivitySummary *> *activities;

@end
