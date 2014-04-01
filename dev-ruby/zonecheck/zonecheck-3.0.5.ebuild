# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gcalctool/gcalctool-5.28.2.ebuild,v 1.2 2010/01/07 21:37:49 fauli Exp $

EAPI="5"

USE_RUBY="ruby18 ruby19 ruby20"

inherit eutils

DESCRIPTION="DNS configuration checker"
HOMEPAGE="http://www.zonecheck.fr"
SRC_URI="http://www.zonecheck.fr/download/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE="cgi doc"

S="${WORKDIR}/${PN}"

RUBY="/usr/bin/ruby"

RDEPEND="dev-lang/ruby[ssl]
	net-misc/iputils
	>=dev-ruby/dnsruby-1.5
	cgi? ( virtual/httpd-cgi )
"

DEPEND="
	$RDEPEND
	dev-lang/perl
"

DOCS="BUGS ChangeLog COPYING CREDITS FAQ GPL HISTORY INSTALL README TODO"
if use doc; then
	DOCS="${DOCS} doc"
fi

src_configure() {
	elog "No configure necessary"
}

src_compile() {
	elog "No compiling necessary"
}

src_test() {
	#LD_LIBRARY_PATH="${WORKDIR}"/${PN}_build/common cmake-utils_src_test
	einfo "No test available"
}

src_install() {
	INST_OPTS="-DCHROOT=${D} -DPREFIX=/usr -DETCDIR=/etc -DETCDIST= "
	INST_OPTS="${INST_OPTS} -DLIBEXEC=/usr/share -DMANDIR=/usr/share/man -DRUBY=${RUBY}"
	TARGETS="common cli"
	if use cgi; then
		INST_OPTS="${INST_OPTS} -DCGIDIR=/var/www/localhost/cgi-bin/ -DWWWDIR=/usr/share/zonecheck-cgi -DWWWCGIDIR=/cgi-bin"
		TARGETS="${TARGETS} cgi"
	fi
	ruby installer.rb ${INST_OPTS} ${TARGETS}

	# Patch the configuration file for Linux netkit ping
	perl -pi -e '
		s/(<const\s+name\s*=\s*"ping4"\s+value\s*=\s*")[^\"]*("\s*\/>)/$1ping  -n -q -w 5 -c 5 %s >\/dev\/null$2/;
		s/(<const\s+name\s*=\s*"ping6"\s+value\s*=\s*")[^\"]*("\s*\/>)/$1ping6 -n -q -w 5 -c 5 %s >\/dev\/null$2/;
	' ${D}/etc/zonecheck/zc.conf

}


