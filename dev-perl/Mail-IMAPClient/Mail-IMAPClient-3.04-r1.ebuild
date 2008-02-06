# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

#S="${WORKDIR}/${P}"
DESCRIPTION="Provides simplify a sockets connection to and an IMAP conversation with an IMAP server"
SRC_URI="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/${P%%-*}/${P}.readme"

RESTRICT="nomirror"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"

DEPEND="
	>=dev-perl/Parse-RecDescent-1.94
    dev-perl/Digest-HMAC
	>=perl-core/File-Temp-0.18
    dev-perl/Test-Pod
"


src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	cd $S
	epatch ${FILESDIR}/dont_ask-${PV}.patch
}

