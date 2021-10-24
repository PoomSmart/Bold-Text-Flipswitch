#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <version.h>

extern BOOL _AXSEnhanceTextLegibilityEnabled();
extern void _AXSSetEnhanceTextLegibilityEnabled(BOOL);

@interface BoldTextSwitch : NSObject <FSSwitchDataSource>
@end

@implementation BoldTextSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
    return _AXSEnhanceTextLegibilityEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
    if (newState == FSSwitchStateIndeterminate)
        return;
    _AXSSetEnhanceTextLegibilityEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier {
	NSURL *url = [NSURL URLWithString:IS_IOS_OR_NEWER(iOS_13_0) ? @"prefs:root=ACCESSIBILITY&path=DISPLAY_AND_TEXT/ENHANCE_TEXT_LEGIBILITY" : @"prefs:root=General&path=ACCESSIBILITY#ENHANCE_TEXT_LEGIBILITY"];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end
