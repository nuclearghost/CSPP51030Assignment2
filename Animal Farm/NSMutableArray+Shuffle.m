//
//  NSMutableArray+Shuffle.m
//  Animal Farm
//
//  Created by Mark Meyer on 1/31/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)

//Taken from the lecture slides
//CSPP51030 Lecture 2 Slide 82
- (NSMutableArray *)shuffle
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id anObject in self) {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    return tmpArray;
}

@end
