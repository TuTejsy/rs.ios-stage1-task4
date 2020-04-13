//
//  Node.h
//  RSSchool_T4
//
//  Created by Vasil' on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (retain, nonatomic) NSString *value;
@property (retain, nonatomic) Node *left;
@property (retain, nonatomic) Node *right;

@end

