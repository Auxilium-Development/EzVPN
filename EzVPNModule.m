#import "EzVPNModule.h"

@property(getter=isEnabled) BOOL enabled;

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation EzVPNModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor yellowColor];
}

- (BOOL)isSelected {
	if ([NEVPNManager isEnabled]) {
		self.ezvpn = TRUE;
	} else {
		self.ezvpn = FALSE;
	}
	return self.ezvpn;
}

- (void)setSelected:(BOOL)selected {
	if ([NEVPNManager isEnabled]) {
		[NEVPNManager isEnabled:FALSE];
		selected = FALSE;
	} else {
		[NEVPNManager isEnabled:TRUE];
		selected = TRUE;
	}
	self.ezvpn = selected;
	[super refreshState];
}
@end
