//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISSentence.h"

@interface FISAppDelegate ()

@end


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISSentence *sentence = [[FISSentence alloc] init];
    sentence.words = [[NSMutableArray alloc] init];
    sentence.punctuation = [[NSString alloc] init];
    
    return YES;
}

@end
