# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

DESCRIPTION="Wallpaper changer, downloader and manager"
HOMEPAGE="http://peterlevi.com/variety/"
SRC_URI="https://launchpad.net/variety/trunk/${PV}/+download/variety_${PV}.tar.gz"

inherit distutils-r1 eutils

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/gobject-introspection
	dev-libs/libappindicator[introspection]
	dev-python/beautifulsoup
	dev-python/configobj
	dev-python/dbus-python
	dev-python/lxml
	dev-python/pillow
	dev-python/pycairo
	dev-python/pycurl
	>=dev-python/pyexiv2-0.3.0
	dev-python/pygobject:3[cairo]
	dev-python/requests
	gnome-extra/yelp
	media-gfx/imagemagick
	media-libs/gexiv2
	net-libs/webkit-gtk:3/25[introspection]
	x11-libs/gdk-pixbuf[introspection]
	x11-libs/gtk+[introspection]
	>=x11-libs/libnotify-0.7
	x11-libs/pango[introspection]
"
DEPEND="
	${RDEPEND}
	dev-python/python-distutils-extra
"

DOCS="AUTHORS COPYING MANIFEST debian/changelog"

S="${WORKDIR}/variety"

