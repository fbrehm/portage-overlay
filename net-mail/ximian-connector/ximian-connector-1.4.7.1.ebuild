# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

#inherit gnome2

# problems with -O3 on gcc-3.3.1
replace-flags -O3 -O2

DESCRIPTION="Ximian Connector (An Evolution Plugin to talk to Exchange Servers)"
SRC_URI="ftp://ftp.ximian.com/pub/source/evolution/${P}.tar.gz"
HOMEPAGE="http://www.ximian.com"

IUSE="ldap"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 -ppc -sparc -alpha -mips"
#RESTRICT="nostrip"

RDEPEND=">=net-mail/evolution-1.4
	>=gnome-extra/gal-1.99.11
    ldap? ( >=net-nds/openldap-2.0 )
	net-libs/linc"
DEPEND=""

#S=${WORKDIR}

src_compile() {
  einfo "Compiling Ximian Connector for Exchange..."
  local myconf=
  use ldap \
        &&  myconf="${myconf} --with-openldap=yes --with-static-ldap=no" \
        || myconf="${myconf} --with-openldap=no"
  econf ${myconf} || die "configure failed"
  emake || die "make failed"
}

src_install() {
  einstall DESTDIR=${D}
}
