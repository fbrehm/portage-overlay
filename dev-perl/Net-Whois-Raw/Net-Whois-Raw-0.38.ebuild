# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

DE_PATCH=whois-de-${PV}.patch

S=${WORKDIR}/${P}
DESCRIPTION="Perl extension for unparsed raw whois information"
SRC_URI="http://cpan.pair.com/modules/by-module/Net/${P}.tgz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/Net/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

src_unpack() {
    unpack ${P}.tgz
    cd ${S}
    epatch ${FILESDIR}/${DE_PATCH}
    rm -f ${S}/lib/Net/Whois/Raw.pm.orig
}

