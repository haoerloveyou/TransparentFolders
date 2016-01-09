#import <UIKit/UIKit.h>

@interface SBFolderIconBackgroundView : UIView
@end

@interface SBWallpaperEffectView : UIView
@end


%hook SBFolderIconImageView 
// Thanks poomsmart
- (void)_updateAccessibilityBackgroundContrast
{
	%orig;
	SBFolderIconBackgroundView *backgroundView = MSHookIvar<SBFolderIconBackgroundView *>(self, "_backgroundView");
	UIView *accessibilityBackgroundView = MSHookIvar<UIView *>(self, "_accessibilityBackgroundView");
	backgroundView.hidden = YES;
	accessibilityBackgroundView.hidden = YES;

}
%end

%hook SBFolderBackgroundView

- (void)_configureAccessibilityBackground
{
	%orig;
	SBWallpaperEffectView *backdropView = MSHookIvar<SBWallpaperEffectView *>(self, "_backdropView");
	backdropView.hidden = YES;

}
%end
