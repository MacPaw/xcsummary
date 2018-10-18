//
//  CMTestableSummary.h
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMEntity.h"

@class CMTest;
@interface CMTestableSummary : CMEntity

@property (nonatomic, copy, readonly) NSString *projectPath;
@property (nonatomic, copy, readonly) NSString *targetName;
@property (nonatomic, copy, readonly) NSString *testName;
@property (nonatomic, copy, readonly) NSString *testObjectClass;

@property (nonatomic, readonly) NSUInteger numberOfSuccessfulTests;
@property (nonatomic, readonly) NSUInteger numberOfFailedTests;
@property (nonatomic, readonly) NSTimeInterval totalDuration;

@property (nonatomic, strong, readonly) NSArray <CMTest *> *tests;

@end
