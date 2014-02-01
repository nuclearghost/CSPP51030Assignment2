//
//  ControlFreakViewController.m
//  Animal Farm
//
//  Created by Mark Meyer on 1/31/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "ControlFreakViewController.h"
#import "Animal.h"
#import "NSMutableArray+Shuffle.h"

@interface ControlFreakViewController ()

@end

@implementation ControlFreakViewController

- (void)buttonTapped:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    Animal *animal = (Animal *)self.animals[btn.tag];
    NSLog(@"%@",animal);
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: animal.soundPath];
    
    AVAudioPlayer *newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    
    [newPlayer play];
}

//Lifted generously from Lecture 2 slides
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    
    Animal *animal = (Animal *)self.animals[page];
    self.label.text = animal.name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animals = [[NSMutableArray alloc] initWithCapacity:3];
    
    Animal *animal;
    for (int i = 0; i < 3; ++i) {
        animal = [[Animal alloc] init];
        animal.age = [[NSNumber alloc] initWithUnsignedInt:arc4random_uniform(30)];
        self.animals[i] = animal;
    }
    animal = (Animal *)self.animals[0];
    animal.name = @"Fox";
    animal.image = [UIImage imageNamed:@"fox.jpg"];
    animal.soundPath = [[NSBundle mainBundle] pathForResource: @"fox"
                                                       ofType: @"m4a"];

    animal = (Animal *)self.animals[1];
    animal.name = @"Llama";
    animal.image = [UIImage imageNamed:@"llama.jpg"];
    animal.soundPath = [[NSBundle mainBundle] pathForResource: @"fox"
                                                       ofType: @"m4a"];
    
    animal = (Animal *)self.animals[2];
    animal.name = @"Seal";
    animal.image = [UIImage imageNamed:@"seal.jpg"];
    animal.soundPath = [[NSBundle mainBundle] pathForResource: @"fox"
                                                       ofType: @"m4a"];
    
    self.animals = [self.animals shuffle];
    
    SEL buttonTappedSel = NSSelectorFromString(@"buttonTapped:");
    
    for (int i = 0; i < 3; ++i) {
        animal = (Animal *)self.animals[i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame = CGRectMake(i*320 + 80, 30, 150, 40);
        
        [btn setTitle:animal.name forState:UIControlStateNormal];
        [btn addTarget:self action:buttonTappedSel forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(i*320,70,320,380);
        imgView.image = animal.image;
        [self._scrollView addSubview:imgView];
        
        [self._scrollView addSubview:btn];
    }
    
    [self scrollViewDidEndDecelerating:self._scrollView];
}

- (void)viewDidLayoutSubviews
{
    [self._scrollView setContentSize:CGSizeMake(960, 500)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
