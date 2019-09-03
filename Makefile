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

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D session/stumpwm-gnome-xsession.desktop $(PATH_STUMPWM_GNOME_XSESSION)
	$(INSTALL) -m0644 -D session/stumpwm-gnome.desktop $(PATH_STUMPWM_GNOME_DESKTOP)
	$(INSTALL) -m0644 -D session/stumpwm-gnome.session $(PATH_STUMPWM_GNOME_SESSION)
	$(INSTALL) -m0755 -D session/stumpwm-gnome $(PATH_STUMPWM_GNOME)


uninstall:
	rm -f $(PATH_STUMPWM_GNOME)
	rm -f $(PATH_STUMPWM_GNOME_DESKTOP)
	rm -f $(PATH_STUMPWM_GNOME_SESSION)
	rm -f $(PATH_STUMPWM_GNOME_XSESSION)


.PHONY: all install uninstall
