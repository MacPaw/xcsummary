//
//  CMAttachment.h
//  XCSummary
//
//  Created by Volodymyr Borodavchuk on 10/3/18.
//  Copyright © 2018 MacPaw inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMEntity.h"

@interface CMAttachment : CMEntity

@property (nonatomic, copy, readonly) NSString *filename;

@end
