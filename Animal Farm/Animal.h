//
//  Animal.h
//  Animal Farm
//
//  Created by Mark Meyer on 1/31/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic,strong) NSString *soundPath;

-(NSString *)description;

@end
