//
//  NSArray+Additions.h
//  xcsummary
//
//  Created by Anton Mironov on 1/13/15.
//  Copyright (c) 2015 MacPaw. All rights reserved.
//

@import Foundation;

@interface NSArray<__covariant ObjectType> (Extensions)

- (NSMutableArray *)map:(id(^)(ObjectType object, NSUInteger index, BOOL *stop))mappingBlock;
- (NSMutableArray *)flatMap:(NSArray *(^)(id object, NSUInteger index, BOOL *stop))mappingBlock;
- (NSMutableArray *)filter:(BOOL(^)(ObjectType object, NSUInteger index, BOOL *stop))filteringBlock;

@property (readonly) ObjectType singleObject; // non-observable
@property (readonly) ObjectType singleObjectOrNil; // non-observable

- (ObjectType)safeObjectAtIndex:(NSInteger)index;

@end


@interface NSMutableArray<ObjectType> (Extensions)

- (BOOL)safeAddObject:(ObjectType)object;
- (void)filterIn:(BOOL(^)(ObjectType object, NSUInteger index, BOOL *stop))filteringBlock;

- (NSArray *)takeObjectsAtIndexes:(NSIndexSet *)indexes;
- (ObjectType)takeObjectAtIndex:(NSUInteger)index;
- (ObjectType)takeLastObject;
- (ObjectType)takeFirstObject;

@end

@interface NSArray (CAAdditions)

- (instancetype)normalizedKeyTimes;

@end
