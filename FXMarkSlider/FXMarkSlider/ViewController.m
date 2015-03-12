//
//  ViewController.m
//  FXMarkSlider
//
//  Created by ftxbird on 15-3-4.
//  Copyright (c) 2015年 e. All rights reserved.
//

#import "ViewController.h"
#import "FXMarkSlider.h"
@interface ViewController ()<FXMarkSliderDelegate>
@property (weak, nonatomic) IBOutlet FXMarkSlider *firstSlider;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstSlider.markPositions = @[@1,@2,@3];
    self.firstSlider.minimumValue = 0;
    self.firstSlider.maximumValue = 3;
    self.firstSlider.delegate = self;
}

- (void)FXSliderTapGestureValue:(CGFloat)selectValue
{
    NSLog(@"%f",selectValue);
    self.textView.font = [UIFont systemFontOfSize:(14.0+selectValue*2)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
