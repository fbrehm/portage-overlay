# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils cmake-utils python

MINOR_VERSION=`echo "${PV}" | sed -e 's/^\([0-9][0-9]*\.[0-9][0-9]*\).*/\1/'`

DESCRIPTION="It changes your desktop wallpaper automatically in a Gnome and Xfce based desktop"
HOMEPAGE="http://sites.google.com/site/haliner/desktopnova/"
SRC_URI="http://launchpad.net/desktopnova/${MINOR_VERSION}/${PV}/+download/${P}.tar.gz"

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


