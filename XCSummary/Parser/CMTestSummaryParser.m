//
//  CMTestSummaryParser.m
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMTestSummaryParser.h"
#import "NSArrayAdditions.h"
#import "CMTestableSummary.h"

@implementation CMTestSummaryParser

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self)
    {
        _path = path;
    }
    return self;
}

- (NSArray <CMTestableSummary *> *)testSummaries
{
    NSDictionary *summaryInfo = [NSDictionary dictionaryWithContentsOfFile:self.path];
    NSArray *testSummaries = summaryInfo[@"TestableSummaries"];
    return [testSummaries map:^id(NSDictionary *testSummary, NSUInteger index, BOOL *stop) {
        return [[CMTestableSummary alloc] initWithDictionary:testSummary];
    }];
}

@end
