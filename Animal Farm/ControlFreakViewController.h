//
//  ControlFreakViewController.h
//  Animal Farm
//
//  Created by Mark Meyer on 1/31/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControlFreakViewController : UIViewController <UIScrollViewDelegate> {}

@property (nonatomic,strong) NSMutableArray *animals;

@property (weak, nonatomic) IBOutlet UIScrollView *_scrollView;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)buttonTapped:(id)sender;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;


@end
