# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gcalctool/gcalctool-5.28.2.ebuild,v 1.2 2010/01/07 21:37:49 fauli Exp $

EAPI="2"

inherit eutils

DESCRIPTION="DNS configuration checker"
HOMEPAGE="http://www.zonecheck.fr"
SRC_URI="http://www.zonecheck.fr/download/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE="cgi"

S="${WORKDIR}/${PN}"

RDEPEND="=dev-lang/ruby-1.8*[ssl]
	net-misc/iputils
	>=dev-ruby/dnsruby-1.5
"

DOCS="ABOUT-NLS AUTHORS ChangeLog* COPYING INSTALL LICENSE NEWS README TODO TRANSLATORS"

src_configure() {
	echo "No configure necessary"
}

src_compile() {
	ruby installer.rb -DCHROOT=${D} \
		-DPREFIX=/usr -DETCDIR=/etc -DETCDIST= \
		-DLIBEXEC=/usr/share -DMANDIR=/usr/share/man -DRUBY=/usr/bin/ruby18 \
		common cli doc
}

src_test() {
	LD_LIBRARY_PATH="${WORKDIR}"/${PN}_build/common cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install
}


