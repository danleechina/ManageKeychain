include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = ManageKeyChain
ManageKeyChain_FILES = main.m DLAppDelegate.m DLRootViewController.m DLDumpEntitlementsViewController.m DLKeychainItemViewController.m DLKeychainListViewController.m DLSearchViewController.m DLManageKeychain.m DLTableViewCell.m
ManageKeyChain_FRAMEWORKS = UIKit CoreGraphics Security
ManageKeyChain_LDFLAGS=-lsqlite3
ManageKeyChain_CFLAGS = -fobjc-arc
STRIP = 0

include $(THEOS_MAKE_PATH)/application.mk

after-stage::
	codesign -fs "$(CER)" --entitlements entitlements.xml $(THEOS_STAGING_DIR)/Applications/ManageKeyChain.app/ManageKeyChain
	$(ECHO_NOTHING)chmod +s $(THEOS_STAGING_DIR)/Applications/ManageKeyChain.app/ManageKeyChain$(ECHO_END)

after-install::
	# install.exec "su mobile -c uicache"
	install.exec "killall \"ManageKeyChain\"" || true
