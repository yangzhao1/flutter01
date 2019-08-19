#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "YYFPSLabel.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    [self testFPSLabel];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)testFPSLabel {
   YYFPSLabel* _fpsLabel = [YYFPSLabel new];
    _fpsLabel.backgroundColor = UIColor.redColor;
    _fpsLabel.frame = CGRectMake(80, 0, 50, 30);
    [_fpsLabel sizeToFit];
    
    [[UIApplication sharedApplication].keyWindow insertSubview:_fpsLabel atIndex:999999999999999];
}
@end
