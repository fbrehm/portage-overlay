# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit perl-module eutils

S=${WORKDIR}/${P}
DESCRIPTION="perl modules to streamline writing Nagios plugins"
SRC_URI="http://search.cpan.org/CPAN/authors/id/T/TO/TONVOON/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/CPAN/authors/id/T/TO/TONVOON/${P}.readme"

DEPEND="${DEPEND}
    dev-perl/Params-Validate
    dev-perl/Class-Accessor
    >=perl-core/Test-Simple-0.62
    dev-perl/Math-Calc-Units
    dev-perl/Config-Tiny
    perl-core/File-Spec
"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="x86 amd64 ~ppc ~sparc ~alpha"
RESTRICT="nomirror"
