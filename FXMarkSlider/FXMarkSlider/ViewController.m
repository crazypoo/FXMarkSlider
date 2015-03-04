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
    self.firstSlider.markPositions = @[@1,@2,@3,@4];
    self.firstSlider.value = 0;
    self.firstSlider.minimumValue = 0;
    self.firstSlider.maximumValue = 5;
    [self.firstSlider addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    self.firstSlider.delegate = self;
}

- (void)FXSliderTapGestureValue:(CGFloat)selectValue
{
    self.textView.font = [UIFont systemFontOfSize:(14.0+selectValue*2)];
}
- (void)valueChange
{
    //改变值避免多次调用
    NSUInteger tempValue = round(self.firstSlider.value);
    if (self.firstSlider.currentValue == tempValue ){
        self.firstSlider.value = self.firstSlider.currentValue;
        return;
    }
    self.firstSlider.currentValue = tempValue;
    [self.firstSlider setValue:tempValue animated:YES];
    self.textView.font = [UIFont systemFontOfSize:(14.0+self.firstSlider.currentValue*2)];
    NSLog(@"%f",self.firstSlider.value);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
