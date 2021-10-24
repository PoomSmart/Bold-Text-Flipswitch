TARGET := iphone:clang:latest:7.0
PACKAGE_VERSION = 1.0.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BoldText

$(BUNDLE_NAME)_FILES = Switch.x
$(BUNDLE_NAME)_FRAMEWORKS = UIKit
$(BUNDLE_NAME)_LIBRARIES = Accessibility flipswitch
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Switches
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
