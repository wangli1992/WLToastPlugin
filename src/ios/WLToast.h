#import <Cordova/CDV.h>
#import "CustomAlert.h"
@interface WLToast : CDVPlugin <CustomAlertDelegate>
- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end