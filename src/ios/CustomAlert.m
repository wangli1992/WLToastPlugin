//
//  CustomAlert.m
//  CustomAlert
//
//  Created by Weizhe He on 2018/5/21.
//  Copyright © 2018年 Weizhe He. All rights reserved.
//

#define screen_width  [UIScreen mainScreen].bounds.size.width
#define screen_height  [UIScreen mainScreen].bounds.size.height
#define WLColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#import "CustomAlert.h"

@interface CustomAlert ()
{
    UIView *backView;
}
@end

@implementation CustomAlert

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    NSLog(@"1111");
    if(self){
       // self.backgroundColor = [UIColor redColor];
        self.frame = frame;
        backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha= 0.4;
        [self addSubview:backView];
        
        UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(50, screen_height/2-100, screen_width-100, 160)];
        alertView.backgroundColor = [UIColor whiteColor];
        alertView.clipsToBounds = YES;
        alertView.layer.cornerRadius = 8.0;
        [backView addSubview:alertView];
        
        UIButton *confirm = [UIButton buttonWithType:UIButtonTypeCustom];
        confirm.frame = CGRectMake(0, 160-42, screen_width-100, 42);
        confirm.clipsToBounds = YES;
        confirm.layer.cornerRadius = 8.0;
        confirm.tag = 1;
        confirm.backgroundColor = [UIColor blueColor];
        [confirm setTitle:@"确定" forState:UIControlStateNormal];
        confirm.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [confirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [confirm addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:confirm];
    }
    return self;
}
-(void)alertShow{
    NSLog(@"333");
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}
-(void)alertHiden{
    [self removeFromSuperview];
}
-(void)confirmClick:(UIButton *)btn{
    if(btn.tag==1){
        NSLog(@"点击的是确定");
        if([_delegate respondsToSelector:@selector(clickBtnTag: withAlert:)])
            [_delegate clickBtnTag:btn.tag  withAlert:self];
    }
   // [backView removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
