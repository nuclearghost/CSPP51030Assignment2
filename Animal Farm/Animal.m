//
//  Animal.m
//  Animal Farm
//
//  Created by Mark Meyer on 1/31/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(NSString *)description{
    return [NSString stringWithFormat:@"Animal Object: name=%@, age=%@, Image=%@", self.name, self.age, self.image];
}

@end
