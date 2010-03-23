# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gcalctool/gcalctool-5.28.2.ebuild,v 1.2 2010/01/07 21:37:49 fauli Exp $

EAPI="2"

inherit eutils cmake-utils distutils

DESCRIPTION="It changes your desktop wallpaper automatically in a Gnome and Xfce based desktop"
HOMEPAGE="http://sites.google.com/site/haliner/desktopnova/"
SRC_URI="http://launchpad.net/gwallpapers/0.7/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE="gnome xfce"

RDEPEND=">=sys-devel/gcc-4
	>=sys-devel/gettext-0.17
	>=sys-devel/make-3.81
	>=dev-util/cmake-2.6.4
	>=dev-lang/python-2.6
	>=x11-libs/gtk+-2.14.0
	>=dev-libs/glib-2
	gnome? ( >=gnome-base/gconf-2 )
	xfce? ( >=xfce-base/xfconf-4 )
	>=dev-libs/libxml2-2.7
	>=dev-libs/dbus-glib-0.76"

DOCS="ABOUT-NLS AUTHORS ChangeLog* COPYING INSTALL LICENSE NEWS README TODO TRANSLATORS"

src_configure() {
	enable_cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_test() {
	LD_LIBRARY_PATH="${WORKDIR}"/${PN}_build/common cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install
}


