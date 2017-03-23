//
//  CMTestSummaryParser.h
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CMTestableSummary;
@interface CMTestSummaryParser : NSObject

/**
 @param path NSString * The path of the 'summary'.plist. Commonly located at DerivedData/Project/Logs/Test
 @return CMTestSummaryParser
 */
- (instancetype)initWithPath:(NSString *)path;

@property (nonatomic, copy, readonly) NSString *path;

/**
 @return NSArray <CMTestableSummary *> * an array of the test summaries.
 */
- (NSArray <CMTestableSummary *> *)testSummaries;

@end

NS_ASSUME_NONNULL_END
