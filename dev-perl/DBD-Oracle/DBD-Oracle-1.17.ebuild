# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$
# $URL$

inherit perl-module

S=${WORKDIR}/${P}
DESCRIPTION="an Oracle interface for Perl 5"
SRC_URI="http://cpan.pair.com/modules/by-module/DBD/${P}.tar.gz"
HOMEPAGE="http://cpan.pair.com/modules/by-module/DBD/${P}.readme"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 ~amd64 ~ppc ~sparc ~alpha"

DEPEND="${DEPEND}
    >=dev-perl/DBI-1.39"


