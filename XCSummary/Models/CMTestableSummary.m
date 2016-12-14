//
//  CMTestableSummary.m
//  xcsummary
//
//  Created by Kryvoblotskyi Sergii on 12/12/16.
//  Copyright © 2016 MacPaw inc. All rights reserved.
//

#import "CMTestableSummary.h"
#import "NSArrayAdditions.h"
#import "CMTest.h"

@implementation CMTestableSummary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        NSArray *rawTests = dictionary[@"Tests"];
        _projectPath = dictionary[@"ProjectPath"];
        _targetName = dictionary[@"TargetName"];
        _testName = dictionary[@"TestName"];
        _testObjectClass = dictionary[@"TestObjectClass"];
        _tests = [rawTests map:^id(NSDictionary *rawTest, NSUInteger index, BOOL *stop) {
            return [[CMTest alloc] initWithDictionary:rawTest];
        }];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n%@ %@ %@\n", [super description], self.testName, self.tests];
}

@end
