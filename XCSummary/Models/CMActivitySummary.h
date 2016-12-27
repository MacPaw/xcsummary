//
//  CMActivitySummary.h
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMEntity.h"

@interface CMActivitySummary : CMEntity

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSUUID *uuid;

@property (nonatomic, readonly) NSTimeInterval startTimeInterval;
@property (nonatomic, readonly) NSTimeInterval finishTimeInterval;

@property (nonatomic, readonly) BOOL hasElementsOfInterest;
@property (nonatomic, readonly) BOOL hasScreenshotData;

@property (nonatomic, strong, readonly) NSArray <CMActivitySummary *> *subActivities;

@end
