//
//  NSArray+Additions.m
//  xcsummary
//
//  Created by Anton Mironov on 1/13/15.
//  Copyright (c) 2015 MacPaw. All rights reserved.
//

#import "NSArrayAdditions.h"

@implementation NSArray (Extensions)

- (NSMutableArray *)map:(id(^)(id object, NSUInteger index, BOOL *stop))mappingBlock
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         id mappedObject = mappingBlock(obj, idx, stop);
         if (mappedObject) {
             [result addObject:mappedObject];
         }
     }];
    
    return result;
}

- (NSMutableArray *)flatMap:(NSArray *(^)(id object, NSUInteger index, BOOL *stop))mappingBlock
{
    NSMutableArray *result = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         NSArray *mappedArray = mappingBlock(obj, idx, stop);
         if (mappedArray.count > 0) {
             [result addObjectsFromArray:mappedArray];
         }
     }];
    
    return result;
}

- (NSMutableArray *)filter:(BOOL(^)(id object, NSUInteger index, BOOL *stop))filteringBlock
{
    return [self map:^id(id object, NSUInteger index, BOOL *stop)
            {
                return filteringBlock(object, index, stop) ? object : nil;
            }];
}

- (id)singleObject
{
    NSAssert(self.count <= 1, @"This method may not be applied for containers with multiple items");
    return self.lastObject;
}

- (id)singleObjectOrNil
{
    return (1 == self.count) ? self.lastObject : nil;
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    id result = nil;
    if (0 <= index && index < self.count)
    {
        result = [self objectAtIndex:index];
    }
    return result;
}

@end


@implementation NSMutableArray (Extensions)

- (BOOL)safeAddObject:(id)object
{
    BOOL didAdd;
    
    if (object)
    {
        [self addObject:object];
        didAdd = YES;
    }
    else
    {
        NSAssert(NO, @"Attempt to add an empty object");
        didAdd = NO;
    }
    
    return didAdd;
}

- (void)filterIn:(BOOL(^)(id object, NSUInteger index, BOOL *stop))filteringBlock
{
    NSMutableIndexSet *indexesOfObjectsToRemove = [NSMutableIndexSet new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if (!filteringBlock(obj, idx, stop))
         {
             [indexesOfObjectsToRemove addIndex:idx];
         }
     }];
    [self removeObjectsAtIndexes:indexesOfObjectsToRemove];
}

- (NSArray *)takeObjectsAtIndexes:(NSIndexSet *)indexes
{
    NSArray *result = [self objectsAtIndexes:indexes];
    [self removeObjectsAtIndexes:indexes];
    return result;
}

- (id)takeObjectAtIndex:(NSUInteger)index
{
    id result = [self objectAtIndex:index];
    [self removeObjectAtIndex:index];
    return result;
}

- (id)takeLastObject
{
    NSUInteger count = self.count;
    return (count > 0) ? [self takeObjectAtIndex:count - 1] : nil;
}

- (id)takeFirstObject
{
    NSUInteger count = self.count;
    return (count > 0) ? [self takeObjectAtIndex:0] : nil;
}

@end

@implementation NSArray (CAAdditions)

- (instancetype)normalizedKeyTimes
{
    CGFloat maxValue = [self.firstObject doubleValue];
    for (NSNumber *keyTime in self)
    {
        maxValue = MAX(maxValue, keyTime.doubleValue);
    }
    
    return [self map:^id(NSNumber *keyTime, NSUInteger index, BOOL *stop)
            {
                return @(keyTime.doubleValue / maxValue);
            }];
}

@end
