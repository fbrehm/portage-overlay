# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit perl-module

DESCRIPTION="companion module to Readonly.pm"
SRC_URI="http://search.cpan.org/CPAN/authors/id/R/RO/ROODE/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/src/ROODE/Readonly-XS-1.04/README"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~amd64 ~x86"
RESTRICT="nomirror"
DEPEND=">=dev-perl/Readonly-1.02"


