#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mwan3
PKG_VERSION:=1.4
PKG_RELEASE:=13

include $(INCLUDE_DIR)/package.mk

define Package/mwan3
   SECTION:=net
   CATEGORY:=Network
   SUBMENU:=Routing and Redirection
   DEPENDS:=+ip +iptables +iptables-mod-conntrack-extra +iptables-mod-ipopt
   TITLE:=Multiwan hotplug script with connection tracking support
   MAINTAINER:=Jeroen Louwes <jeroen.louwes@gmail.com>
   PKGARCH:=all
endef

define Package/mwan3/description
   Hotplug script which makes configuration of multiple WAN interfaces simple and manageable. With loadbalancing/failover support for up to 250 wan interfaces, connection tracking and an easy to manage traffic ruleset.
endef

define Package/mwan3/conffiles
   /etc/config/mwan3
endef

define Build/Compile
endef

define Package/mwan3/install
   $(CP) ./files/* $(1)
endef

define Package/mwan3/postinst
   [ -n "$${IPKG_INSTROOT}" ] || /etc/init.d/mwan3 enable
   exit 0
endef

$(eval $(call BuildPackage,mwan3))
