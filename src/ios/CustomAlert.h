//
//  CustomAlert.h
//  CustomAlert
//
//  Created by Weizhe He on 2018/5/21.
//  Copyright © 2018年 Weizhe He. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAlertDelegate;

@interface CustomAlert : UIView

@property(nonatomic,weak)id<CustomAlertDelegate> delegate;

-(void)alertShow;

-(void)alertHiden;
@end

@protocol CustomAlertDelegate<NSObject>
@required
-(void)clickBtnTag:(NSInteger)index withAlert:(CustomAlert *)alert;

@end
