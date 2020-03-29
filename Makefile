#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr

PATH_STUMPWM_GNOME = $(PREFIX)/bin/stumpwm-gnome
PATH_STUMPWM_GNOME_DESKTOP = $(PREFIX)/share/applications/stumpwm-gnome.desktop
PATH_STUMPWM_GNOME_SESSION = $(PREFIX)/share/gnome-session/sessions/stumpwm-gnome.session
PATH_STUMPWM_GNOME_XSESSION = $(PREFIX)/share/xsessions/stumpwm-gnome.desktop
PATH_STUMPWM_GNOME_SYSTEMD = $(PREFIX)/lib/systemd/user/gnome-session-x11@stumpwm-gnome.target

ifeq (,$(FLAVOR))
	SESSION_DIR=session
else
	SESSION_DIR=session.$(FLAVOR)
endif

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D $(SESSION_DIR)/stumpwm-gnome-xsession.desktop $(PATH_STUMPWM_GNOME_XSESSION)
	$(INSTALL) -m0644 -D $(SESSION_DIR)/stumpwm-gnome.desktop $(PATH_STUMPWM_GNOME_DESKTOP)
	$(INSTALL) -m0644 -D $(SESSION_DIR)/stumpwm-gnome.session $(PATH_STUMPWM_GNOME_SESSION)
	$(INSTALL) -m0755 -D $(SESSION_DIR)/stumpwm-gnome $(PATH_STUMPWM_GNOME)
ifneq (,$(wildcard $(SESSION_DIR)/stumpwm-gnome.target))
	$(INSTALL) -m0644 -D $(SESSION_DIR)/stumpwm-gnome.target $(PATH_STUMPWM_GNOME_SYSTEMD)
endif


uninstall:
	rm -f $(PATH_STUMPWM_GNOME)
	rm -f $(PATH_STUMPWM_GNOME_DESKTOP)
	rm -f $(PATH_STUMPWM_GNOME_SESSION)
	rm -f $(PATH_STUMPWM_GNOME_XSESSION)
	rm -f $(PATH_STUMPWM_GNOME_SYSTEMD)


.PHONY: all install uninstall
