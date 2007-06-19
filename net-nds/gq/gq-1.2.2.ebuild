# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvsroot/gentoo-x86/net-nds/gq/gq-0.6.0.ebuild,v 1.4 2003/06/06 23:58:22 rphillips Exp $

S=${WORKDIR}/${P}
DESCRIPTION="GTK-based LDAP client"
SRC_URI="mirror://sourceforge/gqclient/${P}.tar.gz"
HOMEPAGE="http://www.biot.com/gq/"
IUSE="ssl"
#IUSE="kerberos jpeg nls ssl"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ~sparc"

DEPEND="x11-libs/gtk+*
	>=net-nds/openldap-2
	ssl? ( dev-libs/openssl )"

	#jpeg? ( media-libs/gdk-pixbuf )
	#kerberos? ( || ( app-crypt/heimdal app-crypt/mit-krb5 ) )

src_compile() {
	local myconf="--enable-browser-dnd --enable-cache"

	#use kerberos && myconf="${myconf} --with-kerberos-prefix=/usr"
	
	econf $myconf || die "./configure failed"
	
	emake || die "Compilation failed"
}

src_install() {
	einstall || die "Installation failed"
	
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README* TODO
}
