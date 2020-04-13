//
//  Node.m
//  RSSchool_T4
//
//  Created by Vasil' on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "Node.h"

@implementation Node

@synthesize left;
@synthesize right;
@synthesize value;

- (instancetype)init;
{
    self = [super init];
    if (self) {
        self.value = @"0";
        self.left = nil;
        self.right = nil;
    }
    return self;
}
@end
