# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/ndoutils/ndoutils-1.4_beta7.ebuild,v 1.1 2008/03/08 21:21:36 dertobi123 Exp $

inherit eutils

MY_P=${P/_beta/b}

DESCRIPTION="Nagios addon to store Nagios data in a MySQL database"
HOMEPAGE="http://www.nagios.org"
SRC_URI="mirror://sourceforge/nagios/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/mysql"
RDEPEND="${DEPEND}
	>=net-analyzer/nagios-core-3.0"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	enewgroup nagios
	enewuser nagios -1 /bin/bash /var/nagios/home nagios
}

src_compile() {
	econf \
		--prefix=/usr \
		--bindir=/usr/sbin \
		--sysconfdir=/etc/nagios \
		--with-ndo2db-user=nagios \
		--with-ndo2db-group=nagios \
		--enable-mysql \
		--disable-pgsql || die "econf failed"

	emake -j1 || die "emake failed"
}

src_install() {
	dodir /usr/sbin
	cp ${S}/src/{file2sock,log2ndo,ndo2db-3x,ndomod-3x.o,sockdebug} ${D}/usr/sbin

	dodir /usr/nagios/share/
	cp -R ${S}/db ${D}/usr/nagios/share

	chmod 755 ${D}/usr/sbin/{file2sock,log2ndo,ndo2db-3x,ndomod-3x.o,sockdebug} || "Failed chmod"

	dodoc README REQUIREMENTS TODO UPGRADING Changelog "docs/NDOUTILS DB Model.pdf" "docs/NDOUtils Documentation.pdf"

	sed -i s:socket_name=/usr/local/nagios/var/ndo.sock:socket_name=/var/nagios/ndo.sock:g ${S}/config/ndo2db.cfg

	insinto /etc/nagios
	doins ${S}/config/ndo2db.cfg
	doins ${S}/config/ndomod.cfg

	newinitd ${FILESDIR}/ndo2db.init ndo2db
}

pkg_postinst() {
	elog "To include NDO in your Nagios setup you'll need to activate the NDO broker module"
	elog "in /etc/nagios/nagios.cfg:"
	elog "\tbroker_module=/usr/nagios/bin/ndomod-3x.o config_file=/etc/nagios/ndomod.cfg"
}
