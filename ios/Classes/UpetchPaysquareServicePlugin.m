#import "UpetchPaysquareServicePlugin.h"
#import <upetch_paysquare_service/upetch_paysquare_service-Swift.h>

@implementation UpetchPaysquareServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUpetchPaysquareServicePlugin registerWithRegistrar:registrar];
}
@end
