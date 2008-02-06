# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="This module makes Net::SSLeay's SSL sockets behave with POE"
SRC_URI="http://cpan.perl.org/modules/by-module/POE/${P}.tar.gz"
HOMEPAGE="http://cpan.perl.org/modules/by-module/POE/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"

DEPEND=">=dev-perl/POE-0.31
>=dev-perl/Net-SSLeay-1.30
"
