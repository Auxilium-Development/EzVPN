#import "EzLocationModule.h"

@interface CLLocationManager ()
+ (BOOL)locationServicesEnabled;
+ (void)setLocationServicesEnabled:(BOOL)arg1;
@end

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation EzLocationModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor purpleColor];
}

- (BOOL)isSelected {
	if ([CLLocationManager locationServicesEnabled]) {
		self.ezlocation = TRUE;
	} else {
		self.ezlocation = FALSE;
	}
	return self.ezlocation;
}

- (void)setSelected:(BOOL)selected {
	if ([CLLocationManager locationServicesEnabled]) {
		[CLLocationManager setLocationServicesEnabled:FALSE];
		selected = FALSE;
	} else {
		[CLLocationManager setLocationServicesEnabled:TRUE];
		selected = TRUE;
	}
	self.ezlocation = selected;
	[super refreshState];
}
@end
