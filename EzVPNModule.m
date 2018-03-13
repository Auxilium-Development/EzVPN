#import "EzVPNModule.h"

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation EzVPNModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor purpleColor];
}

- (BOOL)isSelected {
	if ([CLLocationManager locationServicesEnabled]) {
		self.ezvpn = TRUE;
	} else {
		self.ezvpn = FALSE;
	}
	return self.ezvpn;
}

- (void)setSelected:(BOOL)selected {
	if ([CLLocationManager locationServicesEnabled]) {
		[CLLocationManager setLocationServicesEnabled:FALSE];
		selected = FALSE;
	} else {
		[CLLocationManager setLocationServicesEnabled:TRUE];
		selected = TRUE;
	}
	self.ezvpn = selected;
	[super refreshState];
}
@end
