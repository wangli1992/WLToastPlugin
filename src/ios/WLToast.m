/********* WLToast.m Cordova Plugin Implementation *******/

#import "WLToast.h"

@implementation WLToast

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    CustomAlert *alert = [[CustomAlert alloc]initWithFrame:[UIScreen mainScreen].bounds];
    alert.delegate = self;
    [alert alertShow];
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
 }
}
@end
